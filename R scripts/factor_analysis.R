
CobeKAI<-dplyr::select(cobedata, c('detail1', 'detail2', 'detail3', 'detail4', 'creativity1', 'creativity2', 'creativity3', 'creativity4'))
MturkKAI<-dplyr::select(mturkdata, c('detail1', 'detail2', 'detail3', 'detail4', 'creativity1', 'creativity2', 'creativity3', 'creativity4'))


CogKAI<-cog%>%
  filter(level>0)
CogKAI<-CogKAI%>%
  filter(submissionOrder==1)

CogKAI<-dplyr::select(CogKAI, c('detail1', 'detail2', 'detail3', 'detail4', 'creativity1', 'creativity2', 'creativity3', 'creativity4'))


detail_f_mturk<-MturkKAI[, c("detail1", "detail2", "detail3", "detail4")]
alpha(detail_f_mturk)

detail_f_mturk<-MturkKAI[, c("detail1", "detail2", "detail3", "detail4")]
alpha(detail_f_mturk)

creativity_f_mturk<-MturkKAI[, c("creativity1", "creativity2", "creativity3", "creativity4")]
alpha(creativity_f_mturk)


detail_f_Cobe<-CobeKAI[, c("detail1", "detail2", "detail3", "detail4")]
alpha(detail_f_Cobe)

creativity_f_Cobe<-CobeKAI[, c("creativity1", "creativity2", "creativity3", "creativity4")]
alpha(creativity_f_Cobe)

# conformity_f_all<-allKAI[, c("conformity1", "conformity2", "conformity3")]
# 
# alpha(creativity_f_all)
# alpha(detail_f_all)
# alpha(conformity_f_all)
# 
# alpha(creativity_f_cobe)


EFAresult1 = factanal(~ ., data=CobeKAI, factors = 2, rotation = "none", 
                      na.action = na.exclude, scores="regression") #note the formula specification allows NA 

EFAresult2 = factanal(~ ., data=MturkKAI, factors = 2, rotation = "none", 
                      na.action = na.exclude,scores="regression" ) #note the formula specification allows NA 

EFAresult3 = factanal(~ ., CogKAI, factors = 2, rotation = "none", 
                      na.action = na.exclude,scores="regression" ) #note the formula specification allows NA 


cobedata<-cbind(cobedata, EFAresult1$scores)
CogID<-cog%>%
  filter(level>0)
CogID<-CogID%>%
  filter(submissionOrder==1)

mturkdata<-cbind(mturkdata, EFAresult2$scores)
cogdata<-EFAresult3$scores
cogdata<-data.frame(cogdata)
cogdata$Id <- CogID$Id


#match surveydata and gamedata
mturk <- merge(mturkdata,mturkgame,by="Id")
cobe <- merge(cobedata,cobegame,by="Id")
cog <- merge(cogdata,cog,by="Id")


#convert to data frame
cobe<-data.frame(cobe)
mturk<-data.frame(mturk)
cog<-data.frame(cog)
#for reasons yet unknown R changed the names of these vars into Age... resp. Gender.....

colnames(cobe)[2] <- "Age"
colnames(cobe)[3]<-"Gender"

KAI.model <- '
creativity =~ creativity1 + creativity2 + creativity3 +creativity4
att_to_detail =~ detail1 + detail2 + detail3+detail4'



suppressWarnings(KAI.fit <- cfa(KAI.model, data=CobeKAI))
fitmeasures(KAI.fit, c('gfi', 'rmsea',  'bic'), title='KAI fit COBE')
#summary(KAI.fit, standardized=TRUE)
KAI.fit <- cfa(KAI.model, data=MturkKAI)
fitmeasures(KAI.fit, c('gfi', 'rmsea',  'bic'), title='KAI fit MTURK')





