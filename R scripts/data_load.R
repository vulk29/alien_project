cobedata<- read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/survey_Exact_annoymized.xlsx", sheet='Sheet3')
cobegame<- read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/Cobe.xls", sheet='Sheet1')

mturkdata<- read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/mturk final folder/all_batches.xlsx", sheet='Sheet3')
mturkgame<- read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/Mturkers.xls", sheet='Sheet1')

cog<- read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cog sci/cog_ability_ham_measures.xlsx", sheet='Sheet1')

cobedata<-data.frame(cobedata)
mturkdata<-data.frame(mturkdata)
mturkgame<-data.frame(mturkgame)
