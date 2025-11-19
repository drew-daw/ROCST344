#import data and packages
library(tidyverse)
load("cleanedData.RData")

#universal variables
tiltXText <- theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#Question 1

#how does edu access vary across the world? 
#can certain regions and/or countries be priority targets?

#Indicator 4.1.1 is pro. of kids in year 2/3, end of primary, end of lower sec
DataInd <- Data %>% filter(Indicator == "4.1.1", Units == "PERCENT")

DataInd %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  gghighlight(quantile(Value,0.5)<75, calculate_per_facet = T)+
  tiltXText

plotQuantileValue <- function(quant=0.5,value=50, df = DataInd){
  df %>% ggplot(aes(`sub-region`, Value))+
    geom_boxplot()+
    facet_wrap(~`Education level`)+
    gghighlight(quantile(Value,quant)<value, calculate_per_facet = T)+
    tiltXText
}

DataComp <- Data %>% filter(Indicator == "4.1.2", Units == "PERCENT")

DataComp %>% ggplot(aes(region, Value))+
    geom_boxplot()+
    facet_wrap(~`Education level`)+
    gghighlight(quantile(Value,0.25)<50, calculate_per_facet = T)+
    tiltXText

DataFurtherComp <- DataComp %>% 
  group_by(`Education level`, region) %>% 
  filter(quantile(Value,0.25)<50) %>% 
  ungroup() %>%
  filter(!is.na(Value))
  

DataFurtherComp %>% ggplot(aes(region,Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  tiltXText

#Question 3

# key disparities in edu access e.g. gender, age, poverty
nrow(data[!is.na(data$`Education level`),])
unique(data$`Education level`)
