##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################


#Barplot mit Mittelwerten der verschiedenen Iris-Arten

require(viridis)

iris

Mittelwerte.Iris<-tapply(iris$Sepal.Width, INDEX=iris$Species, FUN=mean)
Mittelwerte.Iris

SD.Iris<-tapply(iris$Sepal.Width, INDEX=iris$Species, FUN=sd)
SD.Iris

barplot(height=Mittelwerte.Iris)

barplot(height=Mittelwerte.Iris,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Iris Dataset",
        ylim=c(0,4.5),
        space=c(0.3,0.3,0.3),
        col=viridis(3,alpha=0.7)
)

# Gestrichelte Balken (s/w)

barplot(height=Mittelwerte.Iris,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Iris Dataset",
        ylim=c(0,4.5),
        space=0.3,
        density=c(40,20,5),
        angle=c(10,30,60)
)

# Horzontale Balken

barplot(height=Mittelwerte.Iris,
        las=1,
        xlab="Sepal Width [mm]",
        main="Iris Dataset",
        xlim=c(0,4.5),
        space=0.3,
        horiz=TRUE,
        col=viridis(3,alpha=0.7)
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

X.WerteBarplot<-barplot(height=Mittelwerte.Iris,
                        las=1,
                        ylab="Sepal Width [mm]",
                        xlab="Spezies",
                        main="Iris Datensatz",
                        ylim=c(0,4.5),
                        space=c(0.3,0.3,0.3),
                        col=viridis(3,alpha=0.7)
)

ErrorPlot(x=X.WerteBarplot, y=Mittelwerte.Iris, error=SD.Iris)

