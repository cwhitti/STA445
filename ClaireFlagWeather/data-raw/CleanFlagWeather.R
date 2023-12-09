library(readr)
Pulliam_Airport_Weather_Station <- read_csv("data-raw/Pulliam_Airport_Weather.csv",
                                            col_types = cols(DATE =
                                                               col_character()))
View(Pulliam_Airport_Weather_Station)
library(dplyr)
library(lubridate)
Flagstaff_Weather <- Pulliam_Airport_Weather_Station %>%
  select(DATE,PRCP,SNOW,TMIN,TMAX) %>%
  mutate(DATE=ymd(DATE))
## %>% mutate(Precipitation = PRCP)%>%
##select(DATE,Precipitation,SNOW,TMIN,TMAX)
usethis::use_data(Flagstaff_Weather,overwrite = TRUE)
