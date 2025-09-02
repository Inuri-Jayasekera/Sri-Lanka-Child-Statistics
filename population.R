library(tsibble)
library(fabletools)
library(feasts)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(showtext)
library(sugrrants)
library(plotly)
library(scales)
theme_set(theme_bw())
colnames(population)
typeof(ts.population$Year)
p1<-ggplot(ts.population,aes(x=Year,y=`Child Population`,col="red"))+geom_line()+geom_point()+scale_x_continuous(breaks = seq(min(ts.population$Year),
                                                                                                                max(ts.population$Year),
                                                                                                                2))+labs(y="Child Population in thousands")

ggplotly(p1)      

ts.births<-pivot_longer(births,2:4,names_to = "Group",values_to = "No of Births")
ts.births<-as_tsibble(ts.births,key=Group,index=Year)
ts.births$Year<-as.Date((paste0(ts.births$Year, "-01-01")))
class(ts.births$Year)
p2<-ggplot(ts.births,aes(x=Year,y=`No of Births`,col=Group))+geom_point()+geom_line()+scale_y_continuous(labels = scales::label_number(),breaks = seq(100000, 400000, 50000)     
                                                                                                          )+scale_color_manual(values=c("#AA336A","blue","cyan4"))+theme_bw()
ggplotly(p2)

ts.deaths<-pivot_longer(infant_mortality,2:4,names_to = "Group",values_to = "Infant Deaths per 1000 live births")
ts.deaths<-as_tsibble(ts.deaths,key=Group,index=Year)
ts.deaths$Year<-as.Date((paste0(ts.deaths$Year, "-01-01")))
class(ts.deaths$Year)
p3<-ggplot(ts.deaths,aes(x=Year,y=`Infant Deaths per 1000 live births`,col=Group))+geom_point()+geom_line()
ggplotly(p3)

ts.arrivals<-pivot_longer(arrivals,2:4,names_to = "Group",values_to = "No of arrivals")
ts.arrivals$Year<-as.Date((paste0(ts.arrivals$Year, "-01-01")))
p4<-ggplot(ts.arrivals,aes(x=Year,y=`No of arrivals` , fill=Group))+geom_col(position = "dodge")+scale_x_date(date_breaks = "1 year", date_labels = "%Y")
ts.arrivals<-as_tsibble(ts.arrivals,key=Group,index=Year)
p5<-ggplot(ts.arrivals,aes(x=Year,y=`No of arrivals`,col=Group))+geom_point()+geom_line()+scale_x_date(date_breaks = "1 year", date_labels = "%Y")
ggplotly(p5)

ts.departures<-pivot_longer(departure,2:4,names_to = "Group",values_to = "No of Departures")
ts.departures$Year<-as.Date((paste0(ts.departures$Year, "-01-01")))
ts.departures<-as_tsibble(ts.departures,key=Group,index=Year)
p6<-ggplot(ts.departures,aes(x=Year,y=`No of Departures`,col=Group))+geom_point()+geom_line()+scale_x_date(date_breaks = "1 year", date_labels = "%Y")
ggplotly(p6)

ts.departures1<-pivot_longer(departure,3:4,names_to = "Gender",values_to = "No of Departures")
ts.departures1$Year<-as.Date((paste0(ts.departures1$Year, "-01-01")))
p7<-ggplot(ts.departures1,aes(x=Year,y=`No of Departures` , fill=Gender))+geom_col(position = "dodge")+scale_x_date(date_breaks = "1 year", date_labels = "%Y")

arrivals$arrivals<-arrivals$Total
departure$departures<-departure$Total
df<-inner_join(arrivals,departure,by="Year")
df1<-select(df,Year,arrivals,departures)
ts.departures2<-pivot_longer(df1,2:3,names_to = "Group",values_to = "No of cases")
p7<-ggplot(ts.departures2,aes(x=Year,y=`No of cases` , fill=Group))+geom_col(position = "dodge")+scale_x_continuous(breaks = seq(min(ts.departures2$Year),
                                                                                                                                max(ts.departures2$Year),
                                                                                                                                 1))
ggplotly(p7)
