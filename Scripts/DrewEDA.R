#import data and packages
library(tidyverse)
library(gghighlight)
load("Data/cleanedData.RData")

#universal variables
tiltXText <- theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#Question 1

#how does edu access vary across the world? 
#can certain regions and/or countries be priority targets?

#Indicator 4.1.1 is pro. of kids in year 2/3, end of primary, end of lower sec

#filter data
DataPro <- Data %>% filter(Indicator == "4.1.1", Units == "PERCENT", Sex == "BOTHSEX", `sub-region` != "NA")
lines <- DataPro %>% group_by(`Education level`) %>% summarise(grandMean = mean(Value))
points <- DataPro %>% group_by(`sub-region`, `Education level`) %>% summarise(mean = mean(Value))

#merge for the boxplot graph
DataPro <- left_join(DataPro, lines, by = "Education level")

#plot filtered data
DataPro %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  gghighlight(mean(Value) < mean(grandMean), calculate_per_facet = T)+
  tiltXText+
  geom_hline(aes(yintercept = grandMean), lty = 2, colour = "red", data=lines)+
  geom_point(data = points, aes(y=mean), pch = 4, colour="red")

## look at northern africa
DataAfr <- DataPro %>% filter(`sub-region` == "Northern Africa")

DataAfr %>% ggplot(aes(GeoAreaName, Value))+
  geom_boxplot()+
  facet_wrap(~`Education level`)+
  geom_hline(aes(yintercept = grandMean), lty=2,colour="red",data=lines)




#filter data
DataProSex <- Data %>% filter(Indicator == "4.1.1", Units == "PERCENT", Sex != "BOTHSEX", `sub-region` != "NA")
lines <- DataProSex %>% group_by(`Education level`, Sex) %>% summarise(grandMean = mean(Value))
points <- DataProSex %>% group_by(`sub-region`, `Education level`, Sex) %>% summarise(mean = mean(Value))

#join for highlight
DataProSex <- left_join(DataProSex, lines, by = c("Education level" = "Education level", "Sex" = "Sex"))

#plot filtered data
DataProSex %>% ggplot(aes(`sub-region`, Value))+
  geom_boxplot()+
  facet_grid(Sex~`Education level`)+
  gghighlight(mean(Value) < mean(grandMean), calculate_per_facet = T)+
  geom_hline(aes(yintercept = grandMean), lty=2,colour="red",data=lines)+
  geom_point(aes(y=mean), data=points, pch=4,colour="red")+
  tiltXText

#overall table
DataPro %>% 
  arrange(Value) %>%
  select(GeoAreaName, `sub-region`, TimePeriod, Value, `Education level`, `Type of skill`) %>%
  slice_head(n=10)
  



#############


#table
DataFurtherComp %>% 
  slice_head(n=10)%>%
  select(name, region, `Education level`, Value, TimePeriod)



#Question 3

# key disparities in edu access e.g. gender, age, poverty

#brief data clean and filter
#DataDisp <- Data %>% filter(Indicator == "4.5.1", !(FootNote %in% c("This data point is NIL for the submitting nation.", "This data point is NOT APPLICABLE for the submitting nation.")))

DataPro %>% ggplot(aes(`Education level`,Value))+
  geom_boxplot()+
  facet_wrap(~`Type of skill`)+
  gghighlight(quantile(Value, .5) < 75, calculate_per_facet = T)


#new goal! completion rate
DataComp <- Data %>% filter(Indicator == "4.1.2", Units == "PERCENT")

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

DataComp %>% ggplot(aes(Quantile, Value))+
  geom_boxplot()+
  gghighlight(quantile(Value,0.5)<75)
  
#temporal trend?

DataSexTrend <- Data %>%
  filter(Indicator == "4.1.2",
         Sex != "BOTHSEX") %>%
  group_by(Sex, TimePeriod) %>%
  summarise(
    grandMedian = median(Value, na.rm = TRUE),
    .groups = "drop")

DataSexTrend %>% ggplot(aes(TimePeriod, grandMedian, colour = Sex))+
  geom_line()+
  geom_point()+
  scale_x_continuous(breaks=seq(2010, 2019, by=2))


DataQuanTrend <- DataComp %>%
  group_by(Quantile, TimePeriod) %>%
  summarise(
    grandMedian = median(Value),
    grandMean = mean(Value),
    .groups = "drop")

DataQuanTrend %>% ggplot(aes(TimePeriod, grandMedian, colour = Quantile))+
  geom_line()+
  geom_point()+
  scale_x_continuous(breaks=seq(2010,2019,by=2))+
  gghighlight(median(grandMedian)<75, use_direct_label = F)
