#import data and packages
library(tidyverse)
load("cleanedData.RData")

#Question 1
data %>% ggplot(aes(Value, ))
#Question 3

nrow(data[!is.na(data$`Education level`),])
unique(data$`Education level`)
