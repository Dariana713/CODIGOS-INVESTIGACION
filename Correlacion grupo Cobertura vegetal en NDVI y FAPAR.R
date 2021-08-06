library(raster)
library(rasterVis)
CoberNDVI <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaNDVI_CoberturaVeg.csv")
CoberFAPAR <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaFAPAR_CoberturaVegetal.csv")


str(CoberNDVI)
str(CoberFAPAR)
CoberNDVI$X <- row.names(vegndvitopo)
CoberFAPAR$X <- row.names(CoberFAPAR)


#head(merge(vegndvitopo, CoberFAPAR, by = 'X'))
#str(merge(vegndvitopo, CoberFAPAR, by = 'X'))


CoberNDVI_FAPAR <- (merge(CoberNDVI, CoberFAPAR, by = 'X'))
correnf <- cor(CoberNDVI_FAPAR$mean.x, CoberNDVI_FAPAR$mean.y, method = c("pearson"))
#[1] 0.8949273

#Comportamiento de la NDVI en los grupos de cobertura
#MEDIA
boxplot(CoberNDVI_FAPAR$mean.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))
#desviacion
boxplot(CoberNDVI_FAPAR$sd.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))
#min
boxplot(CoberNDVI_FAPAR$min.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))
#max
boxplot(CoberNDVI_FAPAR$max.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))


#Comportamiento de la FAPAR en los grupos de cobertura
#MEDIA
boxplot(CoberNDVI_FAPAR$mean.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
#desviacion
boxplot(CoberNDVI_FAPAR$sd.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
#min
boxplot(CoberNDVI_FAPAR$min.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
#max
boxplot(CoberNDVI_FAPAR$max.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
