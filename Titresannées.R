Titres2017 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2017.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2017$annee<-2017

categories = table(Titres2017$`Type de document`)
categories
Titres2017$`Type de document`[Titres2017$`Type de document`=='Non empruntable']='DVD jeunesse'
Titres2017$`Type de document`[Titres2017$`Titre`=='Max et Lili cherchent leur métier [Texte imprimé]']='Livre jeunesse'
Titres2017$`Type de document`[Titres2017$`Titre`=='Max et Lili font du camping']='Livre jeunesse'
categories = table(Titres2017$`Type de document`)
categories
#102 n'appartiennent pas à une catégorie (37 non spécifié et 65 Nouveauté)
#on peut peut-etre considéré Nouveauté comme une catégorie informative en soi

head(Titres2017[order(Titres2017$Rang),],5)
# Max et Lili 4 sur 5 et le dernier encore un livre jeunesse

#Classement par catégorie age
Titres2017$age<-'jeunesse'
Titres2017$age[Titres2017$`Type de document`=='Bande dessinée adulte']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Bande dessinée ado']='ado'
Titres2017$age[Titres2017$`Type de document`=='DVD tous publics']='adulte'
Titres2017$age[Titres2017$`Type de document`=='DVD nouveautés tous publics']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Livre adulte']='adulte'
Titres2017$age[Titres2017$`Type de document`=='Livre ado']='ado'
Titres2017$age[Titres2017$`Type de document`=='Nouveauté']='adulte'
classement1=table(Titres2017$age)
classement1
#large prépondérance jeunesse (639), puis adulte (184) et ado très très peu (diminue pas mal par rapport à 2012/2013)

#Classement par type de documents (catégories plus agrégées)
Titres2017$`Type agrégé`<-'Bande dessinée'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Bande dessinée ado']='Bande dessinée'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Bande dessinée jeunesse']='Bande dessinée'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Bande dessinée adulte']='Bande dessinée'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='CD jeunesse']='Multimédia'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='DVD jeunesse']='Multimédia'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='DVD tous publics']='Multimédia'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Livre ado']='Livre'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Livre adulte']='Livre'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Livre jeunesse']='Livre'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Nouveauté']='Nouveauté'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Nouveauté jeunesse']='Nouveauté'
Titres2017$`Type agrégé`[Titres2017$`Type de document`=='Numérique et multimédia jeunesse']='Multimédia'
classement2=table(Titres2017$`Type agrégé`)
classement2
#Bande dessinée largement en tete (518) puis Livre (176), Multimédia (59) et Nouveauté (68)

################ Année 2013 ##################################
Titres2013 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2013.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2013$annee<-2013
categories2 = table(Titres2013$`Type de document`)
categories2
#on n'avait pas la catégorie Revue en 2017

Titres2013$`Type de document`[Titres2013$`Titre`=='Inazuma eleven. 1']='DVD jeunesse'
Titres2013$`Type de document`[Titres2013$`Titre`=='Enfant magazine']='Revue pour adulte'
categories2 = table(Titres2013$`Type de document`)
categories2
#Bande dessinée jeunesse en 1 puis Revue pour adulte

head(Titres2013[order(Titres2013$Rang),],5)
# Revue pour jeunesse /ado dans le top 5

#Classement par catégorie age
Titres2013$age<-'jeunesse'
Titres2013$age[Titres2013$`Type de document`=='Bande dessinée adulte']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Bande dessinée jeunesse >12 ans']='ado'
Titres2013$age[Titres2013$`Type de document`=='DVD-vidéos tous publics']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Livre adulte']='adulte'
Titres2013$age[Titres2013$`Type de document`=='Livre de section jeunesse > 12 ans']='ado'
Titres2013$age[Titres2013$`Type de document`=='Nouveauté']=''
Titres2013$age[Titres2013$`Type de document`=='Revue pour ado']='ado'
Titres2013$age[Titres2013$`Type de document`=='Revue pour adulte']='adulte'
classement3=table(Titres2013$age)
classement3
#large prépondérance ado (707) puis adulte (132) et enfin ado(97)

#Classement par type de documents (catégories plus agrégées)
Titres2013$`Type agrégé`<-'Bande dessinée'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='CD jeunesse']='Multimédia'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='DVD jeunesse']='Multimédia'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='DVD-vidéo tous publics']='Multimédia'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Livre de section jeunesse > 12 ans']='Livre'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Livre adulte']='Livre'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Livre jeunesse']='Livre'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Livre sonore jeunesse']='Livre'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Nouveauté']='Nouveauté'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Revue jeunesse']='Revue'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Revue pour adulte']='Revue'
Titres2013$`Type agrégé`[Titres2013$`Type de document`=='Revue pour ado']='Revue'
classement4=table(Titres2013$`Type agrégé`)
classement4
#Bande dessinée largement en tete puis revue, livre, nouveauté et multimédia

################ Année 2012 ##################################
Titres2012 <- read_delim("~/Cours 4A/S2/Dataviz/Titres2012.csv",";", escape_double = FALSE, trim_ws = TRUE)
Titres2012$annee<-2012
categories3 = table(Titres2012$`Type de document`)
categories3
count(Titres2012$`Type de document` == '')
#pas tout à fait les memes catégories qu'en 2012, 23 observations dont ne connait pas la catégorie
#Trés surprenant on n'a pas de DVD (non jeunesse)??

Titres2012$`Type de document`[Titres2012$`Titre`=='Inazuma eleven. 1']='DVD < 13 ans'
Titres2012$`Type de document`[Titres2012$`Titre`=='Enfant magazine [texte imprimé]']='Revue adulte'
categories3 = table(Titres2012$`Type de document`)
categories3
#Bande dessinée jeunesse en 1 puis Revue pour adulte

head(Titres2012[order(Titres2012$Rang),],5)
# Revue pour jeunesse /ado dans le top 5

#Classement par catégorie age
Titres2012$age<-'jeunesse'
Titres2012$age[Titres2012$`Type de document`=='Bande dessinée adulte']='adulte'
Titres2012$age[Titres2012$`Type de document`=='Bande dessinée ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Livre ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Livre adulte']='adulte'
Titres2012$age[Titres2012$`Type de document`=='Nouveauté']=''
Titres2012$age[Titres2012$`Type de document`=='Revue ado']='ado'
Titres2012$age[Titres2012$`Type de document`=='Revue adulte']='adulte'
classement5=table(Titres2012$age)
classement5
#large prépondérance jeunesse (574) puis adulte (233) et enfin ado(125)

#Classement par type de documents (catégories plus agrégées)
Titres2012$`Type agrégé`<-'Bande dessinée'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='CD jeunesse']='Multimédia'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='DVD < 13 ans']='Multimédia'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Livre ado']='Livre'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Livre adulte']='Livre'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Livre jeunesse']='Livre'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Livre sonore jeunesse']='Livre'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Nouveauté']='Nouveauté'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Revue jeunesse']='Revue'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Revue adulte']='Revue'
Titres2012$`Type agrégé`[Titres2012$`Type de document`=='Revue ado']='Revue'
classement6=table(Titres2012$`Type agrégé`)
classement6
#Bande dessinée largement en tete puis revue, livre, nouveauté et multimédia