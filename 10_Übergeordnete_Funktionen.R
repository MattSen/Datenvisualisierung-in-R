##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

#Übergeordnete Grafik-Optionen

# 1) Die par-Funktion

?par()

Standard.Parameter<-par()

par(mfrow=c(2,2)) #Eine Reihe, zwei Spalten
par(mar=c(6,6,6,6)) #Margin: legt die Ränder einer Garfik fest
par(cex=2) #Schrifgröße
par(xpd=TRUE) #Bei True kann auch "außerhalb des Plots gezeichnet werden


par(Standard.Parameter)


# Ein Beispiel: 4 Grafiken in einer Abbildung
require(viridis)

par(mfrow=c(2,2))

plot(y=iris$Sepal.Width,
     x=iris$Sepal.Length,
     main="Standardeinstellungen")

plot(y=iris$Sepal.Width,
     x=iris$Sepal.Length,
     type="p",
     pch=19,
     cex=1.5,
     las=1,
     ylab="Sepal Width [mm]",
     xlab="Sepal Length [mm]",
     xlim=c(4,8.5),
     ylim=c(1,5),
     main="Mit Anpassungen",
     bty="n",
     col=viridis(3,alpha=0.7)[as.numeric(iris$Species)]
)

boxplot(iris$Sepal.Width~iris$Species,
        main="Standardeinstellungen")

boxplot(iris$Sepal.Width~iris$Species,
        cex=1.5,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Mit Anpassungen",
        ylim=c(2,4.5),
        #notch=T,
        col=viridis(3,alpha=0.7))


# Die Layout-Funktion
?layout()

Layout.Matrix<-matrix(data=c(1,1,2,3),nrow=2, ncol=2, byrow = TRUE)

Layout.Matrix

layout(Layout.Matrix)

# Zeitreihe oben

airquality

Mittelwerte.Temp<-tapply(airquality$Temp, INDEX=airquality$Month, FUN=mean)
Mittelwerte.Temp

SD.Month<-tapply(airquality$Temp, INDEX=airquality$Month, FUN=sd)
SD.Month


plot(y=Mittelwerte.Temp,
     x=names(Mittelwerte.Temp),
     type="l",
     cex=1.5,
     las=1,
     lwd=2,
     ylab="Temperatur [k]",
     xlab="Monat",
     xlim=c(5,9),
     ylim=c(50,90),
     main="Airquality Dataset",
     bty="n",
     col=viridis(1,alpha=0.7)
)


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

#####################################################################

ErrorPlot(x=as.numeric(names(Mittelwerte.Temp)), y=Mittelwerte.Temp, error=SD.Month,col=viridis(1,alpha=0.7))

points(y=Mittelwerte.Temp,
       x=names(Mittelwerte.Temp),
       pch=19,
       cex=2.5,
       col="white")

points(y=Mittelwerte.Temp,
       x=names(Mittelwerte.Temp),
       pch=19,
       cex=1.5,
       col=viridis(1,alpha=0.7))

#Kelchblätter Iris unten

plot(y=iris$Sepal.Width,
     x=iris$Sepal.Length,
     type="p",
     pch=19,
     cex=1.5,
     las=1,
     ylab="Sepal Width [mm]",
     xlab="Sepal Length [mm]",
     xlim=c(4,8.5),
     ylim=c(1,5),
     main="Kelchblätter der Gattung Iris",
     bty="n",
     col=viridis(3,alpha=0.7)[as.numeric(iris$Species)]
)

# Trendlinien hinzufügen

Setosa<-subset(iris, Species == "setosa", select = c(Sepal.Width, Sepal.Length))
Versicolor<-subset(iris, Species == "versicolor", select = c(Sepal.Width, Sepal.Length))
Virginica<-subset(iris, Species == "virginica", select = c(Sepal.Width, Sepal.Length))

abline(lm(Setosa$Sepal.Width~Setosa$Sepal.Length),
       col=viridis(3,alpha=0.7)[1],
       lwd=3)
abline(lm(Versicolor$Sepal.Width~Versicolor$Sepal.Length),
       col=viridis(3,alpha=0.7)[2],
       lwd=3)
abline(lm(Virginica$Sepal.Width~Virginica$Sepal.Length),
       col=viridis(3,alpha=0.7)[3],
       lwd=3)

# Eine Legende hinzufügen

par(xpd=T)

legend(y=5.7,
       x=7.2,
       title="Spezies",
       legend=levels(iris$Species),
       pch=19,
       col=viridis(3,alpha=0.7))

par(xpd=F)

boxplot(iris$Sepal.Width~iris$Species,
        cex=1.5,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Kelchblätter der Gattung Iris",
        ylim=c(2,4.5),
        #notch=T,
        col=viridis(3,alpha=0.7))


par(Standard.Parameter)


