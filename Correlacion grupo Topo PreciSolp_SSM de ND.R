library(raster)
library(rasterVis)
humtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")
PRECISolapNDVI <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaSOLAPEPrecipitacion_para_ndvi.csv")


str(PRECISolapNDVI)
str(humtopo)
PRECISolapNDVI$X <- row.names(vegndvitopo)
humtopo$X <- row.names(humtopo)


#head(merge(vegndvitopo, humtopo, by = 'X'))
#str(merge(vegndvitopo, humtopo, by = 'X'))


PreciS_hum <- (merge(PRECISolapNDVI, humtopo, by = 'X'))
corre <- cor(PreciS_hum$mean.x, PreciS_hum$mean.y, method = c("pearson"))

#Comportamiento de la precipitacion con solape (5 dias antes y despues de los dias de SSM) en cada grupo topografico
#media
boxplot(PreciS_hum$mean.x  ~ as.factor(PreciS_hum$Grupo.x))
#desviacion
boxplot(PreciS_hum$sd.x  ~ as.factor(PreciS_hum$Grupo.x))
#min
boxplot(PreciS_hum$min.x  ~ as.factor(PreciS_hum$Grupo.x))
#max
boxplot(PreciS_hum$max.x  ~ as.factor(PreciS_hum$Grupo.x))

splom(PreciS_hum)

