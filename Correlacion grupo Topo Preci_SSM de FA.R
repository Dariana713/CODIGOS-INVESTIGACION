library(raster)

precipiFA <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaPrecipitacionparaFAPAR.csv")

humtopFAP <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")


str(precipiFA)
str(humtopFAP)
precipiFA$X <- row.names(vegndvitopo)
humtopFAP$X <- row.names(humtopFAP)


#head(merge(vegndvitopo, humtopFAP, by = 'X'))
#str(merge(vegndvitopo, humtopFAP, by = 'X'))


Preci_humFAP <- (merge(precipiFA, humtopFAP, by = 'X'))
corre <- cor(Preci_humFAP$mean.x, Preci_humFAP$mean.y, method = c("pearson"))

#Comportamiento de la precipitacion en cada grupo topografico
#media
boxplot(Preci_humFAP$mean.x  ~ as.factor(Preci_humFAP$Grupo.x))
#desviacion
boxplot(Preci_humFAP$sd.x  ~ as.factor(Preci_humFAP$Grupo.x))
#min
boxplot(Preci_humFAP$min.x  ~ as.factor(Preci_humFAP$Grupo.x))
#max
boxplot(Preci_humFAP$max.x  ~ as.factor(Preci_humFAP$Grupo.x))


#Comportamiento de humedad en cada grupo topografico
#media
boxplot(Preci_humFAP$mean.y ~ as.factor(Preci_humFAP$Grupo.y))
#desviacion
boxplot(Preci_humFAP$sd.y  ~ as.factor(Preci_humFAP$Grupo.y))
#min
boxplot(Preci_humFAP$min.y  ~ as.factor(Preci_humFAP$Grupo.y))
#max
boxplot(Preci_humFAP$max.y  ~ as.factor(Preci_humFAP$Grupo.y))


