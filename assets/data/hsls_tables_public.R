library(tidyverse)
library(reldist)

# 1) Load in HSLS Data - we use the variable name `full_df` below (total: 23,503 students)
# load('assets/data/hsls.RData')


# 2) Change variable names to lowercase
names(full_df) <- tolower(names(full_df))


# 3) Identify and keep only relevant variables
relevant_vars <- c('x4univ1', 'w4w1w2w3stu', 'w2student',  # Weight vars
                   'x4x2sesq5',  # Socioeconomic status
                   'x3tgpatot',  # GPA
                   'x3t1credalg1', 'x3t1credalg2', 'x3t1credprec', 'x3t1credcalc', 'x3t1credtrig',  # Math courses
                   'x4hscompstat',  # HS completion status
                   'x2txmquint', 'x2txmtscor', 'x2txmth',  # Math assessment scores
                   'x4ps1select')  # Postsecondary institution selectivity
full_df <- full_df %>% select(one_of(relevant_vars))


# 4) Create math assessment score indicator (75th percentile)

# X2 Mathematics quintile score (X2TXMQUINT)
# Category	Label            	        Freq	  Pct
# 1	        First (lowest) quintile	  3,359	  14.29
# 2	        Second quintile	          3,706	  15.77
# 3	        Third (middle) quintile	  3,975	  16.91
# 4	        Fouth quintile	          4,491	  19.11
# 5	        Fifth (highest) quintile	5,063	  21.54
# -8	      Unit non-response	        2,909	  12.38

# Verify above quintile variable at 80th percentile

q5 <- full_df %>% filter(x2txmquint == 5)
nrow(q5)  # 5603
min(q5$x2txmtscor)  # 58.0486

q4 <- full_df %>% filter(x2txmquint == 4)
nrow(q4)  # 4491
max(q4$x2txmtscor)  # 58.043

no_missing_df <- full_df %>% filter(x2txmtscor != -8)
scores <- no_missing_df$x2txmtscor
weights <- no_missing_df$w2student

wtd.quantile(scores, q = 0.8, weight = weights)  # 58.043
unique((full_df %>% filter(x2txmtscor > 58.043))$x2txmquint)  # 5

# Create new cutoff at 75th percentile

pct75 <- wtd.quantile(scores, q = 0.75, weight = weights)  # 55.9688
full_df$is_top_quartile <- ifelse(full_df$x2txmtscor > pct75, 1, 0)

top25 <- full_df %>% filter(is_top_quartile == 1)
min(top25$x2txmtscor)  # 55.9704
unique(top25$x2txmquint)  # 5, 4

bottom75 <- full_df %>% filter(is_top_quartile == 0)
max(bottom75$x2txmtscor)  # 55.9688
unique(bottom75$x2txmquint)  # 4, 3, 2, 1, -8

# Cutoff is the same if use `x2txmth`

theta <- no_missing_df$x2txmth
pct75_theta <- wtd.quantile(theta, q = 0.75, weight = weights)  # 1.2232

full_df$is_top_quartile_theta <- ifelse(full_df$x2txmth > pct75_theta, 1, 0)
unique(full_df$is_top_quartile == full_df$is_top_quartile_theta)  # TRUE


# 5) Keep only observations that complete all HSLS components AND are not missing GPA field (total: 12,711 students)
df <- full_df %>% filter(x4univ1 == '11111' & x3tgpatot != -9)


# 6) Define high-achieving student (add `is_high_achieving` column)

# Our criteria for high-achieving are:
# i) Complete HS (HS diploma or GED/equivalent)
# ii) GPA >= 3.5
# iii) Complete at least 1 credit in select math courses
# iv) Math assessment score in top quarter (75th percentile)

df <- df %>% mutate(is_high_achieving = ifelse(x4hscompstat %in% c(1, 2) & x3tgpatot >= 3.5 & (x3t1credalg1 == 1 | x3t1credalg2 == 1 | x3t1credprec == 1 | x3t1credcalc == 1 | x3t1credtrig == 1) & is_top_quartile == 1, 1, 0))


# 7) Create tables

# Table 1: Number of high-achieving students by socgeoeconomic quintile
df1 <- df %>% group_by(x4x2sesq5, is_high_achieving) %>% summarise(frequency = sum(w4w1w2w3stu)) %>% spread(x4x2sesq5, frequency)

df1[,2:6]<-round(df1[,2:6],digits=-1)

# Table 2: Initial post-secondary destination of high-achieving students by socioeconomic quintile
df2 <- df %>% filter(is_high_achieving == 1) %>% group_by(x4x2sesq5, x4ps1select) %>% summarise(frequency = sum(w4w1w2w3stu)) %>% spread(x4x2sesq5, frequency)

df2[,2:6]<-round(df2[,2:6],digits=-1)


# 8) Add % for Table 1
for(col in names(df1)[-1]) {
  df1[paste0(col, '_pct')] = df1[col] / sum(df1[col]) * 100
}


# 9) Add % for Table 2
df3 <- df2[c(2,3,4),]

# Combine 'Inclusive or selectivity not classified, 4-year institution'
df3 <- rbind(df3, colSums(df2[c(5,6), ]))

# Combine 'Selectivity not classified, 2-year or less institution'
df3 <- rbind(df3, colSums(df2[c(7,8), ], na.rm = T))

for(col in names(df3)[-1]) {
  df3[paste0(col, '_pct')] = df3[col] / sum(df3[col]) * 100
}


# 10) Export as CSV
write.csv(df1, file = '~/Desktop/tbl1.csv', row.names = F)
write.csv(df3, file = '~/Desktop/tbl2.csv', row.names = F)
