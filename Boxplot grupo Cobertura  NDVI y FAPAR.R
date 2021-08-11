library(raster)
library(rasterVis)
CoberNDVI <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaNDVI_CoberturaVeg.csv")
CoberFAPAR <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaFAPAR_CoberturaVegetal.csv")

#Correlación
CoberNDVI_FAPAR <- (merge(CoberNDVI, CoberFAPAR, by = 'X'))
correnf <- cor(CoberNDVI_FAPAR$mean.x, CoberNDVI_FAPAR$mean.y, method = c("pearson"))
#[1] 0.8949273

#CORRELACION EN GRUPO TOPO

CoberNDVIT <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/144_TablaEstadisticaNDVI_GrupoTopo.csv")
CoberFAPART <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/144_TablaEstadisticaFAPAR_GrupoTopo.csv")

#Correlación
CoberNDVI_FAPART <- (merge(CoberNDVIT, CoberFAPART, by = 'X'))
correnfT <- cor(CoberNDVI_FAPART$mean.x, CoberNDVI_FAPART$mean.y, method = c("pearson"))
#
#Comportamiento de la NDVI en los grupos de cobertura
#MEDIA
boxplot(CoberNDVI_FAPAR$mean.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))
#desviacion
boxplot(CoberNDVI_FAPAR$sd.x  ~ as.factor(CoberNDVI_FAPAR$Grupo.x))


#Comportamiento de la FAPAR en los grupos de cobertura
#MEDIA
boxplot(CoberNDVI_FAPAR$mean.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
#desviacion
boxplot(CoberNDVI_FAPAR$sd.y  ~ as.factor(CoberNDVI_FAPAR$Grupo.y))
