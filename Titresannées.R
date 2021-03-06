Titres2017 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2017.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2017$annee<-2017

categories = table(Titres2017$`Type de document`)
categories
Titres2017$`Type de document`[Titres2017$`Type de document`=='Non empruntable']='DVD jeunesse'
Titres2017$`Type de document`[Titres2017$`Titre`=='Max et Lili cherchent leur m�tier [Texte imprim�]']='Livre jeunesse'
Titres2017$`Type de document`[Titres2017$`Titre`=='Max et Lili font du camping']='Livre jeunesse'
categories = table(Titres2017$`Type de document`)
categories
#102 n'appartiennent pas � une cat�gorie (37 non sp�cifi� et 65 Nouveaut�)
#on peut peut-etre consid�r� Nouveaut� comme une cat�gorie informative en soi

head(Titres2017[order(Titres2017$Rang),],5)
# Max et Lili 4 sur 5 et le dernier encore un livre jeunesse

#Classement par cat�gorie age
Titres2017$age<-'jeunesse'
Titres2017$age[Titres2017$`Type de document`=='Bande dessin�e adulte']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Bande dessin�e ado']='ado'
Titres2017$age[Titres2017$`Type de document`=='DVD tous publics']='adulte'
Titres2017$age[Titres2017$`Type de document`=='DVD nouveaut�s tous publics']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Livre adulte']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Livre ado']='ado'
Titres2017$age[Titres2017$`Type de document`=='Nouveaut�']='adulte'
classement1=table(Titres2017$age)
classement1
#large pr�pond�rance jeunesse (639), puis adulte (184) et ado tr�s tr�s peu (diminue pas mal par rapport � 2012/2013)

#Classement par type de documents (cat�gories plus agr�g�es)
Titres2017$`Type agr�g�`<-'Bande dessin�e'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Bande dessin�e ado']='Bande dessin�e'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Bande dessin�e jeunesse']='Bande dessin�e'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Bande dessin�e adulte']='Bande dessin�e'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='CD jeunesse']='Multim�dia'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='DVD jeunesse']='Multim�dia'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='DVD tous publics']='Multim�dia'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Livre ado']='Livre'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Livre adulte']='Livre'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Livre jeunesse']='Livre'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Nouveaut�']='Nouveaut�'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Nouveaut� jeunesse']='Nouveaut�'
Titres2017$`Type agr�g�`[Titres2017$`Type de document`=='Num�rique et multim�dia jeunesse']='Multim�dia'
classement2=table(Titres2017$`Type agr�g�`)
classement2
#Bande dessin�e largement en tete (518) puis Livre (176), Multim�dia (59) et Nouveaut� (68)

################ Ann�e 2013 ##################################
Titres2013 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2013.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2013$annee<-2013
categories2 = table(Titres2013$`Type de document`)
categories2
#on n'avait pas la cat�gorie Revue en 2017

Titres2013$`Type de document`[Titres2013$`Titre`=='Inazuma eleven. 1']='DVD jeunesse'
Titres2013$`Type de document`[Titres2013$`Titre`=='Enfant magazine']='Revue pour adulte'
categories2 = table(Titres2013$`Type de document`)
categories2
#Bande dessin�e jeunesse en 1 puis Revue pour adulte

head(Titres2013[order(Titres2013$Rang),],5)
# Revue pour jeunesse /ado dans le top 5

#Classement par cat�gorie age
Titres2013$age<-'jeunesse'
Titres2013$age[Titres2013$`Type de document`=='Bande dessin�e adulte']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Bande dessin�e jeunesse >12 ans']='ado'
Titres2013$age[Titres2013$`Type de document`=='DVD-vid�os tous publics']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Livre adulte']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Livre de section jeunesse > 12 ans']='ado'
Titres2013$age[Titres2013$`Type de document`=='Nouveaut�']=''
Titres2013$age[Titres2013$`Type de document`=='Revue pour ado']='ado'
Titres2013$age[Titres2013$`Type de document`=='Revue pour adulte']='adulte'
classement3=table(Titres2013$age)
classement3
#large pr�pond�rance ado (707) puis adulte (132) et enfin ado(97)

#Classement par type de documents (cat�gories plus agr�g�es)
Titres2013$`Type agr�g�`<-'Bande dessin�e'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='CD jeunesse']='Multim�dia'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='DVD jeunesse']='Multim�dia'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='DVD-vid�o tous publics']='Multim�dia'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Livre de section jeunesse > 12 ans']='Livre'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Livre adulte']='Livre'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Livre jeunesse']='Livre'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Livre sonore jeunesse']='Livre'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Nouveaut�']='Nouveaut�'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Revue jeunesse']='Revue'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Revue pour adulte']='Revue'
Titres2013$`Type agr�g�`[Titres2013$`Type de document`=='Revue pour ado']='Revue'
classement4=table(Titres2013$`Type agr�g�`)
classement4
#Bande dessin�e largement en tete puis revue, livre, nouveaut� et multim�dia

################ Ann�e 2012 ##################################
Titres2012 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2012.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2012$annee<-2012
categories3 = table(Titres2012$`Type de document`)
categories3
count(Titres2012$`Type de document` == '')
#pas tout � fait les memes cat�gories qu'en 2012, 23 observations dont ne connait pas la cat�gorie
#Tr�s surprenant on n'a pas de DVD (non jeunesse)??

Titres2012$`Type de document`[Titres2012$`Titre`=='Inazuma eleven. 1']='DVD < 13 ans'
Titres2012$`Type de document`[Titres2012$`Titre`=='Enfant magazine [texte imprim�]']='Revue adulte'
categories3 = table(Titres2012$`Type de document`)
categories3
#Bande dessin�e jeunesse en 1 puis Revue pour adulte

head(Titres2012[order(Titres2012$Rang),],5)
# Revue pour jeunesse /ado dans le top 5

#Classement par cat�gorie age
Titres2012$age<-'jeunesse'
Titres2012$age[Titres2012$`Type de document`=='Bande dessin�e adulte']='adulte'
Titres2012$age[Titres2012$`Type de document`=='Bande dessin�e ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Livre ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Livre adulte']='adulte'
Titres2012$age[Titres2012$`Type de document`=='Nouveaut�']=''
Titres2012$age[Titres2012$`Type de document`=='Revue ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Revue adulte']='adulte'
classement5=table(Titres2012$age)
classement5
#large pr�pond�rance jeunesse (574) puis adulte (233) et enfin ado(125)

#Classement par type de documents (cat�gories plus agr�g�es)
Titres2012$`Type agr�g�`<-'Bande dessin�e'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='CD jeunesse']='Multim�dia'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='DVD < 13 ans']='Multim�dia'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Livre ado']='Livre'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Livre adulte']='Livre'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Livre jeunesse']='Livre'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Livre sonore jeunesse']='Livre'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Nouveaut�']='Nouveaut�'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Revue jeunesse']='Revue'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Revue adulte']='Revue'
Titres2012$`Type agr�g�`[Titres2012$`Type de document`=='Revue ado']='Revue'
classement6=table(Titres2012$`Type agr�g�`)
classement6
#Bande dessin�e largement en tete puis revue, livre, nouveaut� et multim�dia