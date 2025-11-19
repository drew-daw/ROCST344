#import data and packages
library(tidyverse)
load("cleanedData.RData")

#universal variables
tiltXText <- theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#Question 1

#how does edu access vary across the world? 
#can certain regions and/or countries be priority targets?

#Indicator 4.1.1 is pro. of kids in year 2/3, end of primary, end of lower sec
DataInd <- Data %>% filter(Indicator == "4.1.1")

DataInd1 <- DataInd %>% group_by(`sub-region`, `Education level`) %>% summarise(quar = quantile(Value,0.25))

DataInd %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  gghighlight(quantile(Value,0.25)<50, calculate_per_facet = T)+
  tiltXText
  


DataPer <- Data %>% filter(Units == "PERCENT")
DataRatio <- Data %>% filter(Units == "Ratio")
DataPer %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  tiltXText


#Question 3

# key disparities in edu access e.g. gender, age, poverty
nrow(data[!is.na(data$`Education level`),])
unique(data$`Education level`)
