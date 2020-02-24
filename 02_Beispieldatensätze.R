##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################


#Beispieldatensätze in R

#Wir arbeiten heute aber mit Beispieldatensätze die bereits in R implementiert sind

# Der Iris-Datensatz (Länge und Breite von Blüten und Kelchblättern von 3 Arten der Gattung Iris)
help(iris)
head(iris)
iris$Species
iris[1,2]
iris[,"Species"]
summary(iris)

# Der Luftqualitäts-Datensatz
help(airquality)
airquality
head(airquality)
summary(airquality)

# Wirksamkeit von 6 Insektiziden
help(InsectSprays)
InsectSprays
head(InsectSprays)
summary(InsectSprays)

# Geschwindigkeit und Bremsweg von Autos
help(cars)
cars
head(cars)
summary(cars)

#Umfang von 5 Orangenbäume in Abhängigkeit ihres Alters
help(Orange)
Orange
head(Orange)
summary(Orange)
