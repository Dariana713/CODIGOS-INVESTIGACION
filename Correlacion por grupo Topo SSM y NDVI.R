library(raster)
library(rasterVis)

vegndvitopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/144_TablaEstadisticaNDVI_GrupoTopo.csv")

humtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

str(vegndvitopo)
str(humtopo)
vegndvitopo$X <- row.names(vegndvitopo)
humtopo$X <- row.names(humtopo)


#head(merge(vegndvitopo, humtopo, by = 'X'))
#str(merge(vegndvitopo, humtopo, by = 'X'))


Hum_Veg <- (merge(humtopo, vegndvitopo, by = 'X'))
corre <- cor(Hum_Veg$mean.x, Hum_Veg$mean.y, method = c("pearson"))

#Comportamiento de la humedad en cada grupo topografico
#media
boxplot(Hum_Veg$mean.x  ~ as.factor(Hum_Veg$Grupo.x))
#desviacion
boxplot(Hum_Veg$sd.x  ~ as.factor(Hum_Veg$Grupo.x))
#min
boxplot(Hum_Veg$min.x  ~ as.factor(Hum_Veg$Grupo.x))
#max
boxplot(Hum_Veg$max.x  ~ as.factor(Hum_Veg$Grupo.x))


#Comportamiento del NDVI en cada grupo topografico
#media
boxplot(Hum_Veg$mean.y ~ as.factor(Hum_Veg$Grupo.y))
#desviacion
boxplot(Hum_Veg$sd.y  ~ as.factor(Hum_Veg$Grupo.y))
#min
boxplot(Hum_Veg$min.y  ~ as.factor(Hum_Veg$Grupo.y))
#max
boxplot(Hum_Veg$max.y  ~ as.factor(Hum_Veg$Grupo.y))


