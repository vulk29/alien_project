# we had in total 281 people on mturk
# 272 submitted the game id
# 268 didnt answer incorrectly to the attention check. some others failed to type in correctly their game id
# and finally, we removed some bc they submitted 4 times with 0 changes, out of 25 attempts suggesting they had
# either misinterpreted the game or just clicking through
# upon a close inspection, we had to remove more because of how they answered the KAI survey
# we had 101 people in the lab. because they failed to complete the task correctly, 
# we couldnt match all of them so we are left with 97
# this gives us a dataset of 365 

# remove turkers who answered the fatal heart attack question affirmatively

center_scale <- function(x) {
  scale(x, scale = FALSE)
  #x<-x
}

hist(mturkdata$creativity1+mturkdata$creativity2+mturkdata$creativity3+mturkdata$creativity4)

# summary(mturkdata$creativity1+mturkdata$creativity2+mturkdata$creativity3+mturkdata$creativity4)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   10.00   20.00   23.00   22.24   24.25   28.00       4 

hist(cobedata$creativity1+cobedata$creativity2+cobedata$creativity3+cobedata$creativity4)

mturkdata<-mturkdata%>%
  mutate(sumkai=detail1+detail2+detail3+detail4+creativity1+creativity2+creativity3+creativity4+conformity1+conformity2+conformity3+conformity4)
cobedata<-cobedata%>%
  mutate(sumkai=detail1+detail2+detail3+detail4+creativity1+creativity2+creativity3+creativity4+conformity1+conformity2+conformity3+conformity4)

mturkdata<-mturkdata%>%
  filter(sumkai<75, sumkai>44)

mturkdata<-mturkdata%>%
  filter(heart<1)

hist(mturkdata$creativity1+mturkdata$creativity2+mturkdata$creativity3+mturkdata$creativity4)




#remove demo level and people with multiple attempts
mturkgame<-mturkgame%>%
  group_by(Id)%>%
  filter(session==2)
  
#identify turkers who submitted more than 4 times (in 25) with 0 changes
mturkgamez<-mturkgame%>%
  group_by(factor(Id))%>%
  filter(hamming_prev==0)
mturkgamez<-mturkgamez%>%
  group_by(Id)%>%
  filter(n()>=5)

cobekgamez<-cobegame%>%
  group_by(factor(Id))%>%
  filter(hamming_prev==0)
cobekgamez<-cobekgamez%>%
  group_by(Id)%>%
  filter(n()>=5)


n<-unique(mturkgamez$Id)

#remove those
mturkgame<-anti_join(mturkgame, mturkgamez, by = "Id") 
cobegame<-anti_join(cobegame, cobekgamez, by = "Id")

# from survey data as well
mturkdata<-anti_join(mturkdata, mturkgamez, by = "Id") # this gives you the data for FA and computing the conformity etc vars
cobedata<-anti_join(cobedata, cobekgamez, by = "Id") # this gives you the data for FA and computing the conformity etc vars
colnames(cobedata)[2] <- "Age"
colnames(cobedata)[3]<-"Gender"




#do that here and then merge


#clean the workspace

