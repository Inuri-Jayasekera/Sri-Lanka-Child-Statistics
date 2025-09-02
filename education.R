library(ceylon)
library(tidyverse)
library(sp)
library(viridis)
library(ggplot2)

data(sf_sl_0)
class(sf_sl_0)
ggplot(sf_sl_0) +
  geom_sf()
View(province)
View(district)
new_df<-left_join(district,enrollment,by="DISTRICT")

ggplot(data=new_df) +
  geom_sf()

class(district)
class(new_df)
new_df<-as.data.frame(new_df)

ggplot(data=new_df) +
  geom_sf(aes(fill=School_enrollment))
ggplot(data=new_df,aes(fill=)) +
  geom_sf(aes(fill=Pre_school_enrollment))
class(new_df$geometry)
class(district$geometry)
class(district$DISTRICT)
class(district$population)
