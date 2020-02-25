##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

# Histogramme

#Histogramm
require(viridis)

iris

hist(iris$Sepal.Width)

hist(iris$Sepal.Width,
     main="Histogramm Sepal Width",
     las=1,
     xlim=c(2,4.5),
     ylim=c(0,40),
     xlab="Sepal Width",
     col=viridis(2,alpha=0.8)[2])


hist(iris$Sepal.Width,
     main="Histogramm Sepal/Petal Width",
     las=1,
     xlim=c(0,4.5),
     ylim=c(0,40),
     xlab="Width",
     col=viridis(3,alpha=0.5)[3])

hist(iris$Petal.Width,
     col=viridis(3,alpha=0.5)[2],
     add=TRUE)

legend("topright",legend=c("Sepalen","Petalen"),pch=15,
       col=c(viridis(3,alpha=0.5)[3],viridis(3,alpha=0.5)[2]),
       bty="n")
