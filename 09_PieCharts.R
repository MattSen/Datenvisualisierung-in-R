##### RDA Deutschland Tagung 2020 - Advanced Track - Workshop ##### 

#################### Datenvisualisierung mit R ####################

# Pie Charts
require(viridis)

pie(c(10,20,50))

pie(c(10,20,50),
    labels=c("Gruppe 1","Gruppe 2","Gruppe 3"),
    main="Gruppen",
    clockwise = TRUE,
    edges=200,
    radius=1,
    border=NA,
    col=viridis(3,alpha=0.7)
)

