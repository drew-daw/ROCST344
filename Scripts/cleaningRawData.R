library(tidyverse)
library(rio)

rawData <- import("Data/Goal4.xlsx", col_types = "text")
Countries <- import("Data/allCountries.csv", type = "csv")

data <- rawData %>% select(Indicator, SeriesCode, GeoAreaCode, GeoAreaName, TimePeriod, Value, Source, FootNote, Age, `Education level`, Location, Nature, Quantile, Sex, `Type of skill`,Units)

chars_to_factors_except <- function(df, iDontLike) {
  df %>% mutate(across(!all_of(iDontLike),as.factor))
}

changeToNumber <- function(df, cols){
  df %>% mutate(across(all_of(cols),as.numeric))
}

data <- chars_to_factors_except(data, c("TimePeriod", "Value", "Source", "FootNote"))
data <- changeToNumber(data, c("TimePeriod", "Value"))


#Oscar's code
Countries <- Countries %>% select(`country-code`, name, region, `sub-region`)
Countries <- Countries %>% mutate(`country-code` = factor(`country-code`))

Data <- left_join(data, Countries, join_by(GeoAreaCode == `country-code`))

names(Data)[names(Data) == 'region'] <- 'Continent'
names(Data)[names(Data) == 'sub-region'] <- 'SubRegion'

Data <- Data %>% select(Indicator, SeriesCode, GeoAreaCode, GeoAreaName, TimePeriod, Value, Source, FootNote, Age, `Education level`, Location, Nature, Quantile, Sex, `Type of skill`, Units, Continent, SubRegion)

Data[which(Data$GeoAreaName=="Kosovo"),17] <- "Europe"
Data[which(Data$GeoAreaName=="Kosovo"),18] <- "Southern Europe"
Data[which(Data$GeoAreaName=="Australia and New Zealand"),17] <- "Oceania"
Data[which(Data$GeoAreaName=="Australia and New Zealand"),18] <- "Australia and New Zealand"
Data[which(Data$GeoAreaName=="Oceania (exc. Australia and New Zealand)"),17] <- "Oceania"