cobegame1<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='18091'))
cobegame2<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='18092'))
cobegame3<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='25091'))
cobegame4<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='25092'))

cobegame5<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='0710'))
cobegame6<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='0910'))
cobegame7<- data.frame(read_excel("C:/Users/AU289559/OneDrive - Aarhus universitet/working papers/OrgSciAlienProject/org sci master folder/cobe lab_final folder/AG_plays_cobe.xlsx", sheet='1910'))


cobegame<-rbind(cobegame1, cobegame2, cobegame3, cobegame4, cobegame5, cobegame6, cobegame7)

write.csv(cobegame, 'cobegame.csv')