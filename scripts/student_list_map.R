# CLEAR MEMORY
rm(list = ls())

# LOAD LIBRARIES 
options(max.print=999999)
library(tidyverse)
library(leaflet)
library(formattable)
library(rgdal)
library(tigris)
library(rgeos)
library(rmapshaper)
library(htmlwidgets)

#################### LOAD STUDENT LIST DATA

# load in aggregated student list zip data
student_list <- read.csv("./assets/data/westfield_20180725_zip.csv", na.strings=c("", "NA", "NULL"))

student_list[['zip_code']] = substr(student_list[['Zip.Code']], 1, 5)
student_list[['pct_white']] = sprintf("%.1f", student_list[['White']] / student_list[['Total.Students']] * 100)

student_list <- student_list[-c(8), ]  # get rid of duplicate zip code causing issue w/ merging

#################### LOAD ZIP DATA

# get data by running query:

# SELECT mz.*, zcs.`state_code`, zcs.`state_fips` 
# FROM `meta_zipcode` mz
# LEFT JOIN `zip_code_states` zcs on zcs.`zip_code` = mz.`zip_code`
# ;

# load in zip level data
zip <- read.csv("./assets/data/zip_to_state.csv", na.strings=c("", "NA", "NULL"), colClasses=c("zip_code"="factor"))

# create percent racial composition of zipcode
racevars <- function(df,new_col,pop_subgroup,pop_total){
  df[[new_col]] <- (df[[pop_subgroup]] / df[[pop_total]])*100
  df[[new_col]][is.na(df[[new_col]])] <- 0
  return(df)
}

zip<-racevars(zip,"pct_popam","pop_amerindian","pop_total")
zip<-racevars(zip,"pct_popas","pop_asian","pop_total")
zip<-racevars(zip,"pct_pophi","pop_hispanic","pop_total")
zip<-racevars(zip,"pct_popbl","pop_black","pop_total")
zip<-racevars(zip,"pct_popwh","pop_white","pop_total")
zip<-racevars(zip,"pct_pophp","pop_nativehawaii","pop_total")
zip<-racevars(zip,"pct_poptr","pop_tworaces","pop_total")
zip<-racevars(zip,"pct_popothr","pop_otherrace","pop_total")

zip$pocrace <- rowSums(zip[,c("pct_popbl", "pct_pophi", "pct_popam")], na.rm = TRUE) # sumrows equals zero if all columns are NA

# create var for race breaks [just Black, Hispanic, Native American]
zip$race_brks_nonwhiteasian <- cut(zip$pocrace, 
                                   breaks=c(-1, 20, 40, 60, 80, 90, 101), 
                                   labels=c("0-19%", "20-39%", "40-59%", 
                                            "60-79%", "80-89%", "90-100%"))

# create var for income breaks
zip$inc_brks <- cut(zip$avgmedian_inc_2564, 
                    breaks=c(-1, 50000, 75000, 100000, 150000, 200000, 10000000), 
                    labels=c("<$50k", "$50k-74k", "$75k-99k", 
                             "$100k-149k", "$150k-199k", "$200k+"))

# format values
zip <- zip %>% mutate_at(vars(contains("pct")), funs(sprintf("%.1f", .)))
zip$pocrace <- sprintf("%.1f", zip$pocrace)
zip$avgmedian_inc_2564 <- currency(zip$avgmedian_inc_2564, digits = 0L)

#################### MERGE DATAFRAMES

df <- merge(x = student_list, y = zip, by="zip_code", all.y=TRUE)

df_by_state <- df %>% filter(!is.na(pct_white), !is.na(state_code)) %>% group_by(state_code) %>% count() %>% arrange(desc(n))
View(df_by_state)
states <- as.character(df_by_state$state_code[1:10])
zip_codes <- as.character((zip %>% filter(state_code %in% states))$zip_code)
purchased_zip_codes <- as.character((student_list %>% filter(zip_code %in% zip_codes))$zip_code)

#################### LOAD SHAPE FILES

# load US zip shape file
uspoly <- readOGR('./assets/data/us_geodata/cb_2016_us_zcta510_500k.shp')
uspoly <- merge(uspoly, df, by.x="ZCTA5CE10", by.y="zip_code", all.x = TRUE)

statespoly <- subset(uspoly, ZCTA5CE10 %in% zip_codes)
purchasedpoly <- subset(uspoly, ZCTA5CE10 %in% purchased_zip_codes)

#################### MAP FUNCTION

student_list_map <- function() {
  
  # create shared color scale functions
  color_income <- colorFactor("YlGnBu", statespoly@data$inc_brks)
  color_race <- colorFactor("YlGnBu", statespoly@data$race_brks_nonwhiteasian)
  
  # create popups
  popup_zip <- paste0("<b>", statespoly$zip_name, "</b><br>",
                      "Total Population: ", statespoly$pop_total, "<br>",
                      "Median Household Income: ", statespoly$avgmedian_inc_2564, "<br>",
                      "% Population of Color: ", statespoly$pocrace, "<br>",
                      "% White: ", statespoly$pct_popwh, "<br><br>",
                      "<span style='text-decoration: underline;'>Purchased Students</span><br>",
                      "Total Students: ", statespoly$Total.Students, "<br>",
                      "% White: ", statespoly$pct_white, "<br>"
  )
  
  m <- leaflet() %>%
    addProviderTiles(providers$CartoDB.Positron) %>%
    
    addMiniMap(tiles = providers$CartoDB.Positron,
               toggleDisplay = TRUE) %>%
    
    addPolygons(data = statespoly, stroke = FALSE, fillOpacity = 0.8, smoothFactor = 0.2, color = ~color_income(inc_brks), popup = popup_zip, group = "MSA by Median Household Income") %>%
    addPolygons(data = statespoly, stroke = FALSE, fillOpacity = 0.8, smoothFactor = 0.2, color = ~color_race(race_brks_nonwhiteasian), popup = popup_zip, group = "MSA by Race/Ethnicity") %>%
    addPolylines(data = gUnaryUnion(purchasedpoly, id=NULL), stroke = TRUE, color = "red", weight = 3, group = "Purchased MSA") %>%
    
    # add legends
    addLegend(data = statespoly,
              position = "topright", pal = color_income, values = ~inc_brks,
              title = "Median Household Income",
              className = "info legend legend-income",
              na.label="NA",
              opacity = 1) %>%
    
    addLegend(data = statespoly,
              position = "topright", pal = color_race, values = ~race_brks_nonwhiteasian,
              title = "Black, Latinx, and <br>Native American Population",
              className = "info legend legend-race",
              na.label="NA",
              opacity = 1) %>%
    
    # add options
    addLayersControl(
      position = c("bottomleft"),
      baseGroups = c("MSA by Median Household Income", "MSA by Race/Ethnicity"),
      overlayGroups = c("Purchased MSA"),
      options = layersControlOptions(collapsed = FALSE)
    ) %>%
    
    htmlwidgets::onRender("
        function(el, x) {
            var myMap = this;
            myMap.on('baselayerchange', function(e) {
                $('.legend').css('display', 'none');
                switch (e.name) {
                    case 'MSA by Median Household Income':
                    $('.legend-income').css('display', 'inherit');
                    break;
                    case 'MSA by Race/Ethnicity':
                    $('.legend-race').css('display', 'inherit');
                    break;
                }
                e.layer.bringToBack();
            });
    }")

  m
}

student_list_map()

saveWidget(student_list_map(), 'map_student_list.html', background = 'transparent')
