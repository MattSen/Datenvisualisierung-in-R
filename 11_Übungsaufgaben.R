##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

Standard.Parameter<-par()
Layout.Matrix<-matrix(data=c(1,1,2,3),nrow=2, ncol=2, byrow = TRUE)
layout(Layout.Matrix)

#Umfang von 5 Orangenbäume in Abhängigkeit ihres Alters (Zeitreihe)
Orange
# Wirksamkeit von 6 Insektiziden (Barplot/Boxplot)
InsectSprays
# Geschwindigkeit und Bremsweg von Autos (Scatterplot+Trendlinie)
cars


######################################################################################
# Aufgabe A)##########################################################################
######################################################################################

require(viridis)

Orange

#Für jeden Baum Subsets erzeugen

Tree1<-subset(Orange,Tree==1,select=c("age","circumference"))
Tree2<-subset(Orange,Tree==2,select=c("age","circumference"))
Tree3<-subset(Orange,Tree==3,select=c("age","circumference"))
Tree4<-subset(Orange,Tree==4,select=c("age","circumference"))
Tree5<-subset(Orange,Tree==5,select=c("age","circumference"))

#Bäume einzeln nacheinander plotten

#Tree1

plot(y=Tree1$circumference,
     x=Tree1$age,
     type="l",
     cex=1.5,
     las=1,
     lwd=2,
     ylab="Umfang [mm]",
     xlab="Alter [Tagen]",
     xlim=c(0,2000),
     ylim=c(0,215),
     main="Orange Datensatz",
     bty="n",
     col=viridis(5,alpha=0.7)[1]
)
points(y=Tree1$circumference,
       x=Tree1$age,
       pch=19,
       cex=2.5,
       col="white")

points(y=Tree1$circumference,
       x=Tree1$age,
       pch=19,
       cex=1.5,
       col=viridis(5,alpha=0.7)[1])

#Tree 2

lines(y=Tree2$circumference,
      x=Tree2$age,
      lwd=2,
      col=viridis(5,alpha=0.7)[2])

points(y=Tree2$circumference,
       x=Tree2$age,
       pch=19,
       cex=2.5,
       col="white")

points(y=Tree2$circumference,
       x=Tree2$age,
       pch=19,
       cex=1.5,
       col=viridis(5,alpha=0.7)[2])

#Tree 3

lines(y=Tree3$circumference,
      x=Tree3$age,
      lwd=2,
      col=viridis(5,alpha=0.7)[3])

points(y=Tree3$circumference,
       x=Tree3$age,
       pch=19,
       cex=2.5,
       col="white")

points(y=Tree3$circumference,
       x=Tree3$age,
       pch=19,
       cex=1.5,
       col=viridis(5,alpha=0.7)[3])

#Tree 4

lines(y=Tree4$circumference,
      x=Tree4$age,
      lwd=2,
      col=viridis(5,alpha=0.7)[4])

points(y=Tree4$circumference,
       x=Tree4$age,
       pch=19,
       cex=2.5,
       col="white")

points(y=Tree4$circumference,
       x=Tree4$age,
       pch=19,
       cex=1.5,
       col=viridis(5,alpha=0.7)[4])

#Tree 5

lines(y=Tree5$circumference,
      x=Tree5$age,
      lwd=2,
      col=viridis(5,alpha=0.7)[5])

points(y=Tree5$circumference,
       x=Tree5$age,
       pch=19,
       cex=2.5,
       col="white")

points(y=Tree5$circumference,
       x=Tree5$age,
       pch=19,
       cex=1.5,
       col=viridis(5,alpha=0.7)[5])

#Legende hinzufügen

legend(x=100,y=200,c("Baum 1","Baum 2","Baum 3","Baum 4","Baum 5"),pch=19,col=viridis(5,alpha=0.7),bty="n")

par(xpd=T)
text(x=-50,y=270,"A)",cex=2)
par(xpd=F)

######################################################################################
# Aufgabe B)##########################################################################
######################################################################################


require(viridis)

InsectSprays

Mittelwerte.InsectSprays<-tapply(InsectSprays$count, INDEX=InsectSprays$spray, FUN=mean)
Mittelwerte.InsectSprays

SD.InsectSprays<-tapply(InsectSprays$count, INDEX=InsectSprays$spray, FUN=sd)
SD.InsectSprays

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

X.WerteBarplot<-barplot(height=Mittelwerte.InsectSprays,
                        las=1,
                        ylab="Insekten",
                        xlab="Insektizid",
                        main="InsectSprays Datensatz",
                        ylim=c(0,25),
                        space=c(0.3,0.3,0.3),
                        col=viridis(6,alpha=0.7)
)

ErrorPlot(x=X.WerteBarplot, y=Mittelwerte.InsectSprays, error=SD.InsectSprays)

par(xpd=T)
text(x=0,y=29,"B)",cex=2)
par(xpd=F)

######################################################################################
# Aufgabe C)##########################################################################
######################################################################################

require(viridis)

cars

plot(y=cars$dist,
     x=cars$speed,
     type="p",
     pch=19,
     cex=1.5,
     las=1,
     ylab="Bremsweg [m]",
     xlab="Geschwindigkeig [Km/h]",
     xlim=c(0,25),
     ylim=c(0,120),
     main="cars Datensatz",
     bty="n",
     col=viridis(1,alpha=0.7)
)

# Trendlinien hinzufügen

abline(lm(cars$dist~cars$speed),
       col=viridis(3,alpha=0.7)[1],
       lwd=3)

par(xpd=T)
text(x=0,y=135,"C)",cex=2)
par(xpd=F)
