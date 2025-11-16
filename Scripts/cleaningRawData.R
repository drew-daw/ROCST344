library(tidyverse)
library(readxl)

rawData <- read_excel("Data/Goal4.xlsx", col_types = "text")

data <- rawData %>% select(Indicator, SeriesCode, GeoAreaCode, GeoAreaName, TimePeriod, Value, Source, FootNote, Age, `Education level`, Location, Nature, Quantile, Sex, `Type of skill`,Units)

chars_to_factors_except <- function(df, iDontLike) {
  df %>% mutate(across(!all_of(iDontLike),as.factor))
}

changeToNumber <- function(df, cols){
  df %>% mutate(across(all_of(cols),as.numeric))
}

data <- chars_to_factors_except(data, c("TimePeriod", "Value", "Source", "FootNote"))
data <- changeToNumber(data, c("TimePeriod", "Value"))

save(data, file = "cleanedData.RData")