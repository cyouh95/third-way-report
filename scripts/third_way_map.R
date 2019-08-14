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

#################### UNIVERSITY SAMPLE

# get data by running query: https://github.com/ozanj/joyce_report/blob/407d69285c18f613f6ef2c0f00c419db7a21e40b/index.Rmd#L112-L140

univ_sample <- read.csv('./assets/data/univ_sample.csv', na.strings=c("", "NA", "NULL"))

#################### LOAD MSA DATA

# conversion data is from zip_code_cbsa, meta data is from msa_metadata

# cbsa with highest res ratio is cbsa_1
msa <- read.csv("./assets/data/zip_code_cbsa.csv", na.strings=c("", "NA", "NULL"), colClasses=c("zip_code"="factor", "cbsa_1"="factor"))

# contains all cbsa meta data (including metros, micros, etc)
cbsa <- read.csv("./assets/data/msa_metadata.csv", na.strings=c("", "NA", "NULL"), colClasses=c("cbsa_code"="character", "cbsa_title"="character"))

#################### LOAD ZIP DATA

# get data by running query:

# SELECT mz.*, zcs.`state_code`, zcs.`state_fips` 
# FROM `meta_zipcode` mz
# LEFT JOIN `zip_code_states` zcs on zcs.`zip_code` = mz.`zip_code`
# ;

# load in zip level data
zip <- read.csv("./assets/data/zip_to_state.csv", na.strings=c("", "NA", "NULL"), colClasses=c("zip_code"="factor"))

# rename zip var
names(zip)[names(zip) == 'zip_code'] <- 'zip'

# add MSA to zip
zip <- merge(x = zip, y = msa, by.x="zip", by.y="zip_code", all.x=TRUE)

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

#################### LOAD EVENTS DATA

# get data by running gen_events_data.py in recruiting-dataset-creation

# load in recruiting data
all<-read.csv("./assets/data/events_data_2019-07-13.csv", colClasses=c(determined_zip="character", event_state="character", event_name="character", event_location_name="character", ipeds_id="factor"), na.strings=c("", "NA"), encoding="UTF-8")

# three events missing lat/long
all$latitude[all$pid==66435]<-34.207670
all$longitude[all$pid==66435]<--119.076350

all$latitude[all$pid==66675]<-32.971940
all$longitude[all$pid==66675]<--117.260930

all$latitude[all$pid==74253]<-38.980312
all$longitude[all$pid==74253]<--77.069787

# rename zip var
names(all)[names(all) == 'determined_zip'] <- 'zip'

# add MSA to recruiting events
all <- merge(x = all, y = msa, by.x="zip", by.y="zip_code", all.x=TRUE)

# format values
all <- all %>% mutate_at(vars(contains("pct")), funs(sprintf("%.1f", .)))

# keep only select vars
df <- all %>% select(univ_id, event_state, event_type, event_name, event_location_name, school_id, latitude, longitude, ipeds_id, cbsa_1, cbsa_2, cbsa_3, cbsa_4)

#################### LOAD UNIVERSITY DATA

# data is from meta_university table

# load in university data
ipeds <- read.csv("./assets/data/meta_university.csv", na.strings=c("", "NA", "NULL"), colClasses=c("zip_code"="character", "univ_id"="character", "univ_name"="character"), encoding="UTF-8")

# format values
ipeds <- ipeds %>% mutate_at(vars(contains("pct")), funs(sprintf("%.1f", .))) 
ipeds$tuit_fees_instate <- currency(ipeds$tuit_fees_instate, digits = 0L)
ipeds$tuit_fees_outstate <- currency(ipeds$tuit_fees_outstate, digits = 0L)
ipeds$fteug <- trimws(format(round(ipeds$fteug, 0), big.mark = ','))

# add MSA to univ
ipeds <- merge(x = ipeds, y = msa, by="zip_code", all.x=TRUE)

# subset CC
cc <- subset(ipeds, sector=="Public, 2-year" | sector=="Public, less-than 2-year")

#################### LOAD HS DATA

# get data by running query:

# SELECT 'Public' AS `school_type`, `ncessch`, `name`, `state_code`, `state_fips_code`, `l_zip_code` AS `zip_code`, `latitude`, `longitude`, `total_students`,
# (`wh` / `total_students` * 100) AS `pct_white`,
# (`bl` / `total_students` * 100) AS `pct_black`,
# (`hi` / `total_students` * 100) AS `pct_hispanic`,
# (`as` / `total_students` * 100) AS `pct_asian`,
# (`am` / `total_students` * 100) AS `pct_amerindian`,
# ((`total_students` - `wh` - `bl` - `hi` - `as` - `am`) / `total_students` * 100) AS `pct_other`
# FROM meta_high_school_public
# WHERE `include_school` = 1
# UNION
# SELECT 'Private' AS `school_type`, `ncessch`, `name`, `state_code`, `state_fips_code`, `zip_code`, `latitude`, `longitude`, `total_students`,
# (`total_white` / `total_students` * 100) AS `pct_white`,
# (`total_black` / `total_students` * 100) AS `pct_black`,
# (`total_hispanic` / `total_students` * 100) AS `pct_hispanic`,
# (`total_asian` / `total_students` * 100) AS `pct_asian`,
# (`total_amerindian` / `total_students` * 100) AS `pct_amerindian`,
# ((`total_students` - `total_white` - `total_black` - `total_hispanic` - `total_asian` - `total_amerindian`) / `total_students` * 100) AS `pct_other`
# FROM meta_high_school_private
# WHERE `include_school` = 1
# ;

# load in high school data
hs <- read.csv("./assets/data/hs_data.csv", na.strings=c("", "NA", "NULL"), colClasses=c("zip_code"="factor"), encoding="UTF-8")

# format values
hs <- hs %>% mutate_at(vars(contains("pct")), funs(sprintf("%.1f", .)))
hs$total_students <- trimws(format(round(hs$total_students, 0), big.mark = ','))

# add MSA to HS
hs <- merge(x = hs, y = msa, by="zip_code", all.x=TRUE)

#################### LOAD SHAPE FILES

# load US zip shape file
uspoly_shp <- readOGR('./assets/data/us_geodata/cb_2016_us_zcta510_500k.shp')
uspoly_shp_simplified <- ms_simplify(uspoly_shp)

# merge to zip
uspoly <- merge(uspoly_shp_simplified, zip, by.x="ZCTA5CE10", by.y="zip", all.x = TRUE)

#################### CREATE ICONS

# red X icon
redXIcon <- makeIcon(
  # iconUrl = "https://cdn3.iconfinder.com/data/icons/flat-actions-icons-9/792/Close_Icon-512.png",
  iconUrl = "./assets/images/redXicon.png",
  iconWidth = 6, iconHeight = 8,
  iconAnchorX = 3, iconAnchorY = 4
)

# red univ icon
univIcon <- makeAwesomeIcon(library = 'fa', icon = 'university', markerColor = 'red')

#################### MAP FUNCTION

create_popup <- function(df, popup_type) {
  
  if (popup_type == 'visiting_univ') {
    return(paste0("<b>", df$univ_name, "</b><br>", 
                  "State: ", df$state_code, "<br>",
                  "In-State Tuition: ", df$tuit_fees_instate, "<br>",
                  "Out-of-State Tuition: ", df$tuit_fees_outstate, "<br>",
                  "% Pell: ", df$pct_pell_recipients_freshman, "<br>",
                  "% Black (freshmen): ", df$pct_freshman_black, "<br>",
                  "% Latinx (freshmen): ", df$pct_freshman_hispanic, "<br>",
                  "% Asian (freshmen): ", df$pct_freshman_asian, "<br>",
                  "% Native American (freshmen): ", df$pct_freshman_amerindian, "<br>",
                  "% Multiracial (freshmen): ", df$pct_freshman_tworaces, "<br>",
                  "% White (freshmen): ", df$pct_freshman_white))
  } else if (popup_type == 'hs') {
    return(paste0("<b>",df$name,"</b><br>", 
                  "School Type: ", df$school_type, "<br>",
                  "Total Enrollment: ", df$total_students, "<br>",
                  "% Black: ", df$pct_black, "<br>",
                  "% Latinx: ", df$pct_hispanic, "<br>",
                  "% Asian: ", df$pct_asian, "<br>",
                  "% Native American: ", df$pct_amerindian, "<br>",
                  "% White: ", df$pct_white))
  } else if (popup_type == 'cc') {
    return(paste0("<b>", df$univ_name, "</b><br>",
                  "Total Enrollment: ", df$fteug, "<br>",
                  "In-State Tuition: ", df$tuit_fees_instate, "<br>",
                  "% Pell: ", df$pct_pell_recipients_freshman, "<br>",
                  "% Black (freshmen): ", df$pct_freshman_black, "<br>",
                  "% Latinx (freshmen): ", df$pct_freshman_hispanic, "<br>",
                  "% Asian (freshmen): ", df$pct_freshman_asian, "<br>",
                  "% Native American (freshmen): ", df$pct_freshman_amerindian, "<br>",
                  "% Multiracial (freshmen): ", df$pct_freshman_tworaces, "<br>",
                  "% White (freshmen): ", df$pct_freshman_white))
  }
  
}

third_way_map <- function(univs, metros) {
  
  # create shared color scale functions
  color_income <- colorFactor("YlGnBu", uspoly@data$inc_brks)
  color_race <- colorFactor("YlGnBu", uspoly@data$race_brks_nonwhiteasian)
  
  # identify common non-visit hs and cc (so only need to load once on map)
  shared_nonvisit_pubhs <- subset(hs, school_type == "Public" & !(ncessch %in% df$school_id))
  shared_nonvisit_privhs <- subset(hs, school_type == "Private" & !(ncessch %in% df$school_id))
  shared_nonvisit_cc <- subset(cc, !(univ_id %in% df$ipeds_id))
  
  data <- list()

  for (metro in metros) {
    print(metro)
    
    data[[metro]] <- list()

    # name of MSA
    data[[metro]]$cbsa_name <- (cbsa %>% filter(cbsa_code == metro))$cbsa_title

    # spatial polygon of MSA
    msapoly <- subset(uspoly, (cbsa_1 == metro | cbsa_2 == metro | cbsa_3 == metro | cbsa_4 == metro))
    
    msa_shape <- msapoly
    msa_shape@polygons <- list()
    poly_ids <- names(msapoly@polygons)
    for (idx in seq_along(poly_ids)) {
      msa_shape@polygons[[idx]] <- msapoly@polygons[[poly_ids[idx]]]
    }

    data[[metro]]$cbsa_shape <- msa_shape

    # outline shape of MSA
    msa_union <- gUnaryUnion(msapoly, id=NULL)
    data[[metro]]$cbsa_outline <- msa_union

    # coordinates of MSA
    cbsa_coordinates <- as.numeric(coordinates(msa_union))
    data[[metro]]$cbsa_lng <- cbsa_coordinates[1]
    data[[metro]]$cbsa_lat <- cbsa_coordinates[2]

    # population color scale function for MSA
    data[[metro]]$color_pop <- colorNumeric("YlGnBu", msapoly@data$pop_total, n=5)
    
    # zip-code pop-ups for MSA
    data[[metro]]$popup_income <- paste0("Zip Code: ", msapoly$ZCTA5CE10, "<br>", "Median Household Income: ", msapoly$avgmedian_inc_2564)
    data[[metro]]$popup_pop <- paste0("Zip Code: ", msapoly$ZCTA5CE10, "<br>", "Total Population: ", trimws(format(msapoly$pop_total, big.mark = ',')))
    data[[metro]]$popup_race <- paste0("Zip Code: ", msapoly$ZCTA5CE10, "<br>", "% Black, Latinx, and Native American: ", msapoly$pocrace)

    # subset all hs and cc in MSA
    msa_pubhs <- subset(hs, school_type == "Public" & (cbsa_1 == metro | cbsa_2 == metro | cbsa_3 == metro | cbsa_4 == metro))
    msa_privhs <- subset(hs, school_type == "Private" & (cbsa_1 == metro | cbsa_2 == metro | cbsa_3 == metro | cbsa_4 == metro))
    msa_cc <- subset(cc, (cbsa_1 == metro | cbsa_2 == metro | cbsa_3 == metro | cbsa_4 == metro))
    
    # create shared non-visit vars in MSA
    
    shared_pubhs_nv <- subset(msa_pubhs, ncessch %in% shared_nonvisit_pubhs$ncessch)
    data[[metro]]$pubhs_nonvisits <- shared_pubhs_nv
    
    shared_privhs_nv <- subset(msa_privhs, ncessch %in% shared_nonvisit_privhs$ncessch)
    data[[metro]]$privhs_nonvisits <- shared_privhs_nv
    
    shared_cc_nv <- subset(msa_cc, univ_id %in% shared_nonvisit_cc$univ_id)
    data[[metro]]$cc_nonvisits <- shared_cc_nv
    
    # add shared non-visit popups
    
    data[[metro]]$popup_pubhsnonvisit <- create_popup(shared_pubhs_nv, 'hs')
    data[[metro]]$popup_privhsnonvisit <- create_popup(shared_privhs_nv, 'hs')
    data[[metro]]$popup_ccnonvisit <- create_popup(shared_cc_nv, 'cc')
    
    # univ data for MSA
    for (univ in univs) {

      # subset visits by the university of interest in metro of interest
      tempdf <- subset(df, univ_id==univ & (cbsa_1 == metro | cbsa_2 == metro | cbsa_3 == metro | cbsa_4 == metro))
      
      # create visit vars
      pubschool <- tempdf %>% filter(event_type == "pub_hs")
      pubhs_visits <- subset(hs, (ncessch %in% pubschool$school_id))
      data[[metro]][[univ]]$pubhs_visits <- pubhs_visits
      
      privschool <- tempdf %>% filter(event_type == "priv_hs")
      privhs_visits <- subset(hs, (ncessch %in% privschool$school_id))
      data[[metro]][[univ]]$privhs_visits <- privhs_visits
      
      ccschool <- tempdf %>% filter(event_type == "cc")
      cc_visits <- subset(cc, (univ_id %in% ccschool$ipeds_id))
      data[[metro]][[univ]]$cc_visits <- cc_visits
      
      other_visits <- subset(tempdf, (event_type=="other" | event_type=="pub_4yr" | event_type=="pse"))
      data[[metro]][[univ]]$other_visits <- other_visits
      
      # create non-visit vars (unique)
      temppubhs_nv <- subset(msa_pubhs, !(ncessch %in% tempdf$school_id) & !(ncessch %in% shared_nonvisit_pubhs$ncessch))
      data[[metro]][[univ]]$pubhs_nonvisits <- temppubhs_nv
      
      tempprivhs_nv <- subset(msa_privhs, !(ncessch %in% tempdf$school_id) & !(ncessch %in% shared_nonvisit_privhs$ncessch))
      data[[metro]][[univ]]$privhs_nonvisits <- tempprivhs_nv
      
      tempcc_nv <- subset(msa_cc, !(univ_id %in% tempdf$ipeds_id) & !(univ_id %in% shared_nonvisit_cc$univ_id))
      data[[metro]][[univ]]$cc_nonvisits <- tempcc_nv
      
      # add visit pop-ups
      data[[metro]][[univ]]$popup_pubhsvisit <- create_popup(pubhs_visits, 'hs')
      data[[metro]][[univ]]$popup_privhsvisit <- create_popup(privhs_visits, 'hs')
      data[[metro]][[univ]]$popup_ccvisit <- create_popup(cc_visits, 'cc')
      data[[metro]][[univ]]$popup_othervisit <- paste0("<b>", ifelse(is.na(other_visits$event_name), other_visits$event_location_name, other_visits$event_name), "</b>",
                                                       ifelse(is.na(other_visits$event_name), "", paste0("<br>", other_visits$event_location_name)))
      
      # add non-visit pop-ups (unique)
      data[[metro]][[univ]]$popup_pubhsnonvisit <- create_popup(temppubhs_nv, 'hs')
      data[[metro]][[univ]]$popup_privhsnonvisit <- create_popup(tempprivhs_nv, 'hs')
      data[[metro]][[univ]]$popup_ccnonvisit <- create_popup(tempcc_nv, 'cc')
      
    }
  }
  
  for (univ in univs) {
    
    # subset university of interest
    tempuniv <- subset(ipeds, univ_id == univ)
    data[[univ]]$univ_data <- tempuniv
    
    # add univ pop-up
    data[[univ]]$popup_univ <- create_popup(tempuniv, 'visiting_univ')
    
  }
  
  js <- read_file('scripts/third_way_map.js')
  
  metro_choices <- cbsa %>% filter(cbsa_code %in% metros) %>% select(cbsa_code, cbsa_title)
  metro_choices <- metro_choices %>% rowwise %>% mutate(cbsa_lat = data[[cbsa_code]]$cbsa_lat)
  metro_choices <- metro_choices %>% rowwise %>% mutate(cbsa_lng = data[[cbsa_code]]$cbsa_lng)
  
  univ_choices <- univ_sample %>% filter(univ_id %in% univs) %>% select(univ_id, univ_name)
  
  choices <- list(metro_choices = metro_choices, univ_choices = univ_choices)
  
  # mapping
  m <- leaflet() %>%
    addProviderTiles(providers$CartoDB.Positron) %>%

    addMiniMap(tiles = providers$CartoDB.Positron,
               toggleDisplay = TRUE) %>%
    
    addEasyButton(easyButton(
      icon="fa-crosshairs", title="Toggle View",
      onClick=JS("function(btn, map){ let zoom = $(btn.button).attr('data-national'); $('.custom-control').slideUp(); if (zoom === 'true') { let $sel = $('input[name=\"metro-choice\"]:checked'); map.setView([$sel.attr('data-lat'), $sel.attr('data-lng')], 8.2); $(btn.button).attr('data-national', false); $('#view-btn').html('National View'); } else { map.setView([39.828, -98.580], 4); $(btn.button).attr('data-national', true); $('#view-btn').html('MSA View'); }}"))) %>%
    
    addEasyButton(easyButton(
      icon="fa-globe", title="Select Metro Area",
      onClick=JS("function(btn, map){ $('.custom-control').not('#metro-control').slideUp(); $('#metro-control').slideToggle(); }"))) %>%
    
    addEasyButton(easyButton(
      icon="fa-university", title="Select University",
      onClick=JS("function(btn, map){ $('.custom-control').not('#univ-control').slideUp(); $('#univ-control').slideToggle(); }"))) %>%
    
    addMeasure(position = "bottomright",
               primaryLengthUnit = "miles")
  
  for (univ in univs) {
    
    # add univ marker
    m <- m %>% addAwesomeMarkers(data = data[[univ]]$univ_data, lng = ~longitude, lat = ~latitude, icon = univIcon, popup = data[[univ]]$popup_univ, options = markerOptions(title = paste0("univ-pin-", univ)))
  
  }
  
  for (metro in metros) {
    print(metro)

    # add zip overlays
    m <- m %>% addPolylines(data = data[[metro]]$cbsa_outline, stroke = TRUE, color = "black", weight = 3, group = "MSA", options = c(className = paste0("metro-shape metro-", metro))) %>%
               addPolygons(data = data[[metro]]$cbsa_shape, stroke = FALSE, fillOpacity = 0.8, smoothFactor = 0.2, color = ~color_income(inc_brks), popup = data[[metro]]$popup_income, group = "MSA by Median Household Income", options = pathOptions(className = paste0("metro-shape metro-", metro))) %>%
               addPolygons(data = data[[metro]]$cbsa_shape, stroke = FALSE, fillOpacity = 0.8, smoothFactor = 0.2, color = ~data[[metro]]$color_pop(pop_total), popup = data[[metro]]$popup_pop, group = "MSA by Population Total", options = pathOptions(className = paste0("metro-shape metro-", metro))) %>%
               addPolygons(data = data[[metro]]$cbsa_shape, stroke = FALSE, fillOpacity = 0.8, smoothFactor = 0.2, color = ~color_race(race_brks_nonwhiteasian), popup = data[[metro]]$popup_race, group = "MSA by Race/Ethnicity", options = pathOptions(className = paste0("metro-shape metro-", metro))) %>%
    
    # add shared non-visit markers
    addCircleMarkers(data = data[[metro]]$pubhs_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Public High Schools',
                     radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = '#2267ff',
                     popup = data[[metro]]$popup_pubhsnonvisit, options = pathOptions(className = paste0("univ-pin univ-shared-", metro))) %>%

    addCircleMarkers(data = data[[metro]]$privhs_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Private High Schools',
                     radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = '#d16822',
                     popup = data[[metro]]$popup_privhsnonvisit, options = pathOptions(className = paste0("univ-pin univ-shared-", metro))) %>%

    addCircleMarkers(data = data[[metro]]$cc_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Community Colleges',
                     radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = 'green',
                     popup = data[[metro]]$popup_ccnonvisit, options = pathOptions(className = paste0("univ-pin univ-shared-", metro)))

    # addMarkers(data = data[[metro]]$pubhs_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]]$popup_pubhsnonvisit, group = "Non-Visited Public High Schools", options = markerOptions(title = paste0("univ-shared-", metro))) %>%
    # addMarkers(data = data[[metro]]$privhs_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]]$popup_privhsnonvisit, group = "Non-Visited Private High Schools", options = markerOptions(title = paste0("univ-shared-", metro))) %>%
    # addMarkers(data = data[[metro]]$cc_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]]$popup_ccnonvisit, group = "Non-Visited Community Colleges", options = markerOptions(title = paste0("univ-shared-", metro)))
    
    for (univ in univs) {
      print(univ)
      
      # add visit markers
      m <- m %>% addCircleMarkers(data = data[[metro]][[univ]]$pubhs_visits, lng = ~longitude, lat = ~latitude, group = 'Public High School Visits',
                                  radius = 3, fill = TRUE, fillOpacity = 1, weight = 1, color = 'white', fillColor = 'blue',  # '#42a9c6'
                                  popup = data[[metro]][[univ]]$popup_pubhsvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%
          
      addCircleMarkers(data = data[[metro]][[univ]]$privhs_visits, lng = ~longitude, lat = ~latitude, group = 'Private High School Visits',
                       radius = 3, fill = TRUE, fillOpacity = 1, weight = 1, color = 'white', fillColor = '#ffa01c',  # '#d16822'
                       popup = data[[metro]][[univ]]$popup_privhsvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%
        
      addCircleMarkers(data = data[[metro]][[univ]]$cc_visits, lng = ~longitude, lat = ~latitude, group = 'Community College Visits',
                       radius = 3, fill = TRUE, fillOpacity = 1, weight = 1, color = 'white', fillColor = '#009614',  # '#30af37'
                       popup = data[[metro]][[univ]]$popup_ccvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%
      
      addCircleMarkers(data = data[[metro]][[univ]]$other_visits, lng = ~longitude, lat = ~latitude, group = 'Other Visits',
                       radius = 3, fill = TRUE, fillOpacity = 1, weight = 1, color = 'white', fillColor = '#fc00f8',  # '#8030d1'
                       popup = data[[metro]][[univ]]$popup_othervisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%
      
      # add non-visit markers (unique)
      addCircleMarkers(data = data[[metro]][[univ]]$pubhs_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Public High Schools',
                       radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = '#2267ff',
                       popup = data[[metro]][[univ]]$popup_pubhsnonvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%

      addCircleMarkers(data = data[[metro]][[univ]]$privhs_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Private High Schools',
                       radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = '#d16822',
                       popup = data[[metro]][[univ]]$popup_privhsnonvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ))) %>%

      addCircleMarkers(data = data[[metro]][[univ]]$cc_nonvisits, lng = ~longitude, lat = ~latitude, group = 'Non-Visited Community Colleges',
                       radius = 2, fill = TRUE, fillOpacity = 0, opacity = 1, weight = 1, color = 'green',
                       popup = data[[metro]][[univ]]$popup_ccnonvisit, options = pathOptions(className = paste0("univ-pin univ-", metro, "-", univ)))
        
      # addMarkers(data = data[[metro]][[univ]]$pubhs_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]][[univ]]$popup_pubhsnonvisit, group = "Non-Visited Public High Schools", options = markerOptions(title = paste0("univ-", metro, "-", univ))) %>%
      # addMarkers(data = data[[metro]][[univ]]$privhs_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]][[univ]]$popup_privhsnonvisit, group = "Non-Visited Private High Schools", options = markerOptions(title = paste0("univ-", metro, "-", univ))) %>%
      # addMarkers(data = data[[metro]][[univ]]$cc_nonvisits, lng = ~longitude, lat = ~latitude, icon = redXIcon, popup = data[[metro]][[univ]]$popup_ccnonvisit, group = "Non-Visited Community Colleges", options = markerOptions(title = paste0("univ-", metro, "-", univ)))
      
    }
  }
  
  m <- m %>% 
    
    # add legends
    addLegend(data = data[[metro]]$cbsa_shape,
              position = "topright", pal = color_income, values = ~inc_brks,
              title = "Median Household Income",
              className = "info legend legend-income",
              na.label="NA",
              opacity = 1) %>%
    
    addLegend(data = data[[metro]]$cbsa_shape,
              position = "topright", pal = data[[metro]]$color_pop, values = ~pop_total,
              title = "Population Total",
              className = "info legend legend-pop",
              na.label="NA",
              opacity = 1) %>%

    addLegend(data = data[[metro]]$cbsa_shape,
              position = "topright", pal = color_race, values = ~race_brks_nonwhiteasian,
              title = "Black, Latinx, and <br>Native American Population",
              className = "info legend legend-race",
              na.label="NA",
              opacity = 1) %>%
    
    # uncheck options by default
    hideGroup("Public High School Visits") %>%
    hideGroup("Private High School Visits") %>%
    hideGroup("Community College Visits") %>%
    hideGroup("Other Visits") %>%
    hideGroup("Non-Visited Public High Schools") %>%
    hideGroup("Non-Visited Private High Schools") %>%
    hideGroup("Non-Visited Community Colleges") %>%
    hideGroup("MSA by Median Household Income") %>%
    hideGroup("MSA by Population Total") %>%
    hideGroup("MSA by Race/Ethnicity") %>%
    
    # add options
    addLayersControl(
      position = c("bottomleft"),
      baseGroups = c("MSA", "MSA by Median Household Income", "MSA by Population Total", "MSA by Race/Ethnicity"),
      overlayGroups = c("Public High School Visits", "Non-Visited Public High Schools", "Private High School Visits", "Non-Visited Private High Schools", "Community College Visits", "Non-Visited Community Colleges", "Other Visits"),
      options = layersControlOptions(collapsed = FALSE)
    ) %>%
    
    htmlwidgets::onRender(js, choices)
  
  m

}

#################### SAVE HTML

# subset univ sample
univs <- as.character(unique(df$univ_id))
metros <- unique(as.character(univ_sample$metro1))

metros <- c(metros, '16980')  # Chicago

# univs <- c('110653', '110635')  # Irvine, Berkeley
# metros <- c('31080', '35620')  # LA, NY

third_way_map(c('215293', '110653'), c('16980', '35620'))

# .eq(1) for base layer selection
saveWidget(third_way_map(univs, metros), 'map_income.html', background = 'transparent')

# .eq(3) for base layer selection
saveWidget(third_way_map(univs, metros), 'map_race.html', background = 'transparent')
