##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

# Grundfunktionen für den heutigen Kurs

# Aufbau: Funktion(Parameter1=..., Parameter2=..., Parameter3=...)

#1) Datensätze anpassen

#Die Subset-Funktion
iris

?subset()

Setosa<-subset(iris, Species == "setosa", select = c(Sepal.Width, Sepal.Length))
Versicolor<-subset(iris, Species == "versicolor", select = c(Sepal.Width, Sepal.Length))
Virginica<-subset(iris, Species == "virginica", select = c(Sepal.Width, Sepal.Length))

#2) Mittelwerte und Standardabweichung berechnen
Setosa

?mean()
?sd()

mean(Setosa$Sepal.Width)
sd(Setosa$Sepal.Width)


#Die tapply Funktion
?tapply()

Mittelwerte.Iris<-tapply(iris$Sepal.Width, INDEX=iris$Species, FUN=mean)
Mittelwerte.Iris

SD.Iris<-tapply(iris$Sepal.Width, INDEX=iris$Species, FUN=sd)
SD.Iris

#3) Grafiken erstellen

?plot()
?boxplot()
?barplot()
?hist()
?pie()

#4) Untergeordnete Grafik-Funktionen
?points()
?lines()
?abline()
?legend()
?text()
?polygon()
?rect()

#Übergeordnete Grafik-Funktionen
?par()
?layout()

# Exkurs - Funktionen programmieren. R hat keine eingebaute Funktion für Fehlerbalken.

ErrorPlot<-function(x=NULL,y=NULL,error=NULL,col="black"){
  
  if (length(x)==length(y) & length(x)==length(error)){
    for (i in 1:length(x)){
      arrows(
        y0=y[i],
        y1=y[i]+error[i],
        x0=x[i],
        x1=x[i],
        col=col,angle=90,length=0.04,lwd=2)
      
      arrows(
        y0=y[i],
        y1=y[i]-error[i],
        x0=x[i],
        x1=x[i],
        col=col,angle=90,length=0.04,lwd=2)
    }
  }else {
    print("Different lengths of variables")
  }
}
