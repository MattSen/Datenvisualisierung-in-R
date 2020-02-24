##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

# 1) Streudiagramm (mit Grundeinstellungen)

iris

plot(y=iris$Sepal.Width,
     x=iris$Sepal.Length)

# 2) Streudiagramm (angepasste Einstellungen)

require(viridis)

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
     main="Iris Datensatz",
     bty="n",
     col=viridis(3,alpha=0.7)[as.numeric(iris$Species)]
     #col=brewer.pal(3, "Set1")[iris$Species]
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


#####################################################################
#####################################################################

# 3) Zeitreihen

require(viridis)

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
     main="Airquality Datensatz",
     bty="n",
     col=viridis(1,alpha=0.7)
)



# Exkurs - Funktionen programmieren. R hat keine eingebaute Funktion für Fehlerbalken.

ErrorPlot<-function(x=NULL,y=NULL,error=NULL,col="black"){
  
  if (length(x)==length(y) & length(x)==length(error)){
    for (i in 1:length(x)){
        arrows(
          y0=y[i],
          y1=y[i]+error[i],
          x0=x[i],
          x1=x[i],
          col=col,angle=90,length=0.04,lwd=1)

        arrows(
          y0=y[i],
          y1=y[i]-error[i],
          x0=x[i],
          x1=x[i],
          col=col,angle=90,length=0.04,lwd=1)
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

