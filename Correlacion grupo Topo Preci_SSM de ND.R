library(raster)

precipindvi <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaPrecipitacion_para_ndvi.csv")

humtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")


str(precipindvi)
str(humtopo)
precipindvi$X <- row.names(vegndvitopo)
humtopo$X <- row.names(humtopo)


#head(merge(vegndvitopo, humtopo, by = 'X'))
#str(merge(vegndvitopo, humtopo, by = 'X'))


Preci_hum <- (merge(precipindvi, humtopo, by = 'X'))
corre <- cor(Preci_hum$mean.x, Preci_hum$mean.y, method = c("pearson"))

#Comportamiento de la precipitacion en cada grupo topografico
#media
boxplot(Preci_hum$mean.x  ~ as.factor(Preci_hum$Grupo.x))
#desviacion
boxplot(Preci_hum$sd.x  ~ as.factor(Preci_hum$Grupo.x))
#min
boxplot(Preci_hum$min.x  ~ as.factor(Preci_hum$Grupo.x))
#max
boxplot(Preci_hum$max.x  ~ as.factor(Preci_hum$Grupo.x))


#Comportamiento de humedad en cada grupo topografico
#media
boxplot(Preci_hum$mean.y ~ as.factor(Preci_hum$Grupo.y))
#desviacion
boxplot(Preci_hum$sd.y  ~ as.factor(Preci_hum$Grupo.y))
#min
boxplot(Preci_hum$min.y  ~ as.factor(Preci_hum$Grupo.y))
#max
boxplot(Preci_hum$max.y  ~ as.factor(Preci_hum$Grupo.y))


