##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################


#Boxlots mit den Iris-Datensatz
require(viridis)

boxplot(iris$Sepal.Width~iris$Species)

boxplot(iris$Sepal.Width~iris$Species,
        cex=1.5,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Iris Datensatz",
        ylim=c(2,4.5),
        #notch=T,
        col=viridis(3,alpha=0.7))

rect(xleft=1.5,xright=3.5,ybottom=1.9,ytop=4.5,col="white",border=NA)

text(x=1.6,y=4.43,"Maximum",cex=0.8)
text(x=1.7,y=3.7,"Oberes Quartil",cex=0.8)
text(x=1.6,y=3.43,"Median",cex=0.8)
text(x=1.71,y=3.23,"Unteres Quartil",cex=0.8)
text(x=1.6,y=2.9,"Minimum",cex=0.8)
text(x=1.6,y=2.33,"Ausreiﬂer",cex=0.8)

boxplot(iris$Sepal.Width~iris$Species,
        cex=1.5,
        las=1,
        ylab="Sepal Width [mm]",
        xlab="Spezies",
        main="Iris Dataset",
        ylim=c(2,4.5),
        #notch=T,
        col=viridis(3,alpha=0.7))

