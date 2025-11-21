#import data and packages
library(tidyverse)
load("cleanedData.RData")

#universal variables
tiltXText <- theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#Question 1

#how does edu access vary across the world? 
#can certain regions and/or countries be priority targets?

#Indicator 4.1.1 is pro. of kids in year 2/3, end of primary, end of lower sec

#filter data
DataPro <- Data %>% filter(Indicator == "4.1.1", Units == "PERCENT", Sex == "BOTHSEX", `sub-region` != "NA")

#plot filtered data
DataPro %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  gghighlight(quantile(Value,0.5)<75, calculate_per_facet = T)+
  tiltXText

#filter data
DataProSex <- Data %>% filter(Indicator == "4.1.1", Units == "PERCENT", Sex != "BOTHSEX", `sub-region` != "NA")

#plot filtered data
DataProSex %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_grid(Sex~`Education level`)+
  gghighlight(quantile(Value,0.5)<75, calculate_per_facet = T)+
  tiltXText

DataPro %>% ##NOT ARRAGING RIGHT.
  arrange(desc(Value)) %>%
  slice_tail(n=10) %>%
  select(GeoAreaName, TimePeriod, Value, `Education level`, `Type of skill`)



#############
DataComp <- Data %>% filter(Indicator == "4.1.2", Units == "PERCENT")

DataComp %>% ggplot(aes(region, Value))+
    geom_boxplot()+
    facet_wrap(~`Education level`)+
    gghighlight(quantile(Value,0.5)<75, calculate_per_facet = T)+
    tiltXText


##look at quantile plot
DataFurtherComp <- DataComp %>% 
  group_by(`Education level`, region) %>% 
  filter(quantile(Value,0.5)<75) %>% 
  arrange(Value) %>%
  filter(Sex == "BOTHSEX") %>%
  ungroup()
levels(DataFurtherComp$Quantile)[1] <- "Total"

#graph
DataFurtherComp %>% filter(!is.na(region)) %>% ggplot(aes(region,Value))+
  geom_boxplot()+
  facet_grid(`Education level` ~ Quantile)+
  gghighlight(quantile(Value,0.5)<75, calculate_per_facet = T)+
  tiltXText

#table
DataFurtherComp %>% 
  slice_head(n=10)%>%
  select(name, region, `Education level`, Value, TimePeriod)



#Question 3

# key disparities in edu access e.g. gender, age, poverty
nrow(data[!is.na(data$`Education level`),])
unique(data$`Education level`)


