library(tidyverse)
library(ggplot2)
library(scales)
my_data<-read.delim(file.choose())
my_data
sapply(my_data,class)
head(my_data)
summary(my_data)
any(is.na(my_data)) 

outlier<-boxplot(my_data$Time.min.)$out
cleaned<-my_data[-which(my_data$Time.min. %in% outlier),]
cleaned

ggplot(cleaned,aes(y=Time.min.))+
  geom_boxplot(alpha=0.3,color="blue",fill="yellow")+
  scale_y_continuous(labels=comma)+
  theme(axis.text.x=element_blank())

stem(cleaned$Age)

ggplot(cleaned,aes(x=Time.min.))+
  geom_histogram(color="darkblue",fill="lightblue",binwidth=100)+
  scale_x_continuous(labels=comma)

ggplot(cleaned,aes(x=Direction))+
  geom_bar(color="darkblue",fill="lightblue")+
  ylab("Count")

ggplot(cleaned,aes(x="",y=Time.min.,fill=Sex))+
  geom_bar(stat="Identity")+
  coord_polar("y",start=0)+
  ylab("Time (min)")+xlab("")


