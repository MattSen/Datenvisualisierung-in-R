##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

# 1) Einzelne Werte einer Variablen zuweisen:
Wert<-5
Wert

# 2) Mehrere Werte (Vektor) einer Variablen zuweisen
Werte<-c(1,2,3,4,5)
Werte

# 3) Ene Liste erstellen
Liste<-list(Wert,Werte)
Liste

# 4) Eine Matrix erstellen
Tabelle<-matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),ncol=3, byrow=TRUE, dimnames= list(c("Zeile1", "Zeile2", "Zeile3", "Zeile4"),c("Spalte1", "Spalte2", "Spalte3")))
Tabelle
DataTable<-as.data.frame(Tabelle)
DataTable

#plot(Tabelle)
#plot(DataTable)

#5) Externe Tabellen einlesen

Daten<-read.table("C:/.....",header=TRUE,sep=";")
Daten
Daten<-read.csv("C:/.....",header=TRUE,sep=";")
Daten
Daten<-read.delim("clipboard",header=TRUE,sep=";")
Daten

# 6) Importfunktion von R-Studio
install.packages("readr")
require(readr)
