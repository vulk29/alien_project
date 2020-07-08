data<-data%>%
  filter(level>0)
data<-data%>%
  filter(usedHelp<2)
data$Id<-factor(data$Id)




data$pozitive <- ifelse(data$feedback_max > 0, 1, 0)
data$pozitive<-factor(data$pozitive)



data$local_search <- ifelse(data$hamming_best > 1, 0, 1)
data$local_search<-factor(data$local_search)
#data$interdep <- ifelse(data$interdep > 0, 1, 0)

data$submissionOrderbin<- cut(data$submissionOrder,
                                   breaks=c(-Inf, 10, 20, Inf),
                                   labels=c("0","1","2"))



#data<-subset(data, !is.na(hamming_best) & !is.na(creativity) & !is.na(pozitive)) 