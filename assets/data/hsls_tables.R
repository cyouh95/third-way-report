library(tidyverse)

# 1) Load in HSLS Data - we use the variable name `full_df` below (total: 23,503 students)
# load('hsls.RData')


full_df<-read_dta("C:/Data/HSLS/HSLS 2009-2016 Update/Data/f2student.dta" )

# 2) Change variable names to lowercase
names(full_df) <- tolower(names(full_df))


# 3) Identify and keep only relevant variables
relevant_vars <- c('x4univ1', 'w4w1w2w3stu',  # Weight vars
                   'x4x2sesq5',  # Socioeconomic status
                   'x3tgpatot',  # GPA
                   'x3t1credalg1', 'x3t1credalg2', 'x3t1credprec', 'x3t1credcalc', 'x3t1credtrig',  # Math courses
                   'x4hscompstat',  # HS completion status
                   'x4txsatcomp',  # SAT scores
                   'x4ps1select')  # Postsecondary institution selectivity
full_df <- full_df %>% select(one_of(relevant_vars))


# 4) Keep only observations that complete all HSLS components AND are not missing GPA field (total: 12,711 students)
df <- full_df %>% filter(x4univ1 == '11111' & x3tgpatot != -9)


# 5) Define high-achieving student (add `is_high_achieving` column)

# Our criteria for high-achieving are:
# i) Complete HS (HS diploma or GED/equivalent)
# ii) GPA >= 3.5
# iii) Complete at least 1 credit in select math courses
# iv) SAT score >= 1100

df <- df %>% mutate(is_high_achieving = ifelse(x4hscompstat %in% c(1, 2) & x3tgpatot >= 3.5 & (x3t1credalg1 == 1 | x3t1credalg2 == 1 | x3t1credprec == 1 | x3t1credcalc == 1 | x3t1credtrig == 1) & x4txsatcomp >= 1100, 1, 0))


# 6) Create tables

# Table 1: Number of high-achieving students by socgeoeconomic quintile
df1 <- df %>% group_by(x4x2sesq5, is_high_achieving) %>% summarise(frequency = sum(w4w1w2w3stu)) %>% spread(x4x2sesq5, frequency)

df1[,2:6]<-round(df1[,2:6],digits=-1)

# Table 2: Initial post-secondary destination of high-achieving students by socioeconomic quintile
df2 <- df %>% filter(is_high_achieving == 1) %>% group_by(x4x2sesq5, x4ps1select) %>% summarise(frequency = sum(w4w1w2w3stu)) %>% spread(x4x2sesq5, frequency)

df2[,2:6]<-round(df2[,2:6],digits=-1)


# 7) Export the dataframes to .RData files
save(df1, file = 'df1.RData')
save(df2, file = 'df2.RData')
