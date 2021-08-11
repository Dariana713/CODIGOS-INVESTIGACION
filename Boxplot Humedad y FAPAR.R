library(raster)
library(rasterVis)

vegFAPARtopo <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/144_TablaEstadisticaFAPAR_GrupoTopo.csv")
humtopoF <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")

#Correlación Humedad y FAPAR Topo
Hum_VegFAPAR <- (merge(humtopoF, vegFAPARtopo, by = 'X'))
corref <- cor(Hum_VegFAPAR$mean.x, Hum_VegFAPAR$mean.y, method = c("pearson"))

#Correlación humedad y FAPAR Cobertura
vegFAPARCobe <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaFAPAR_CoberturaVegetal.csv")
humtopoFco <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaEstadisticaHumedad_CoberturaVeg_de_FAPARCORREGIDA.csv")
Hum_VegFAPARc <- (merge(humtopoFco, vegFAPARCobe, by = 'X'))
correFC <- cor(Hum_VegFAPARc$mean.x, Hum_VegFAPARc$mean.y, method = c("pearson"))



#Comportamiento del FAPAR en cada grupo topografico
boxplot(Hum_VegFAPAR$mean.y, Hum_VegFAPAR$sd.y, Hum_VegFAPAR$min.y, Hum_VegFAPAR$max.y, Hum_VegFAPAR$media.y)
#media
boxplot(Hum_VegFAPAR$mean.y ~ as.factor(Hum_VegFAPAR$Grupo.y))
#desviacion
boxplot(Hum_VegFAPAR$sd.y  ~ as.factor(Hum_VegFAPAR$Grupo.y))
#Grafico de lineas 13, 15, 17

#Comportamiento de la humedad de FAPAR en cada grupo topografico
boxplot(Hum_VegFAPAR$mean.x, Hum_VegFAPAR$sd.x, Hum_VegFAPAR$min.x, Hum_VegFAPAR$max.x, Hum_VegFAPAR$median.x)
#media
boxplot(Hum_VegFAPAR$mean.x  ~ as.factor(Hum_VegFAPAR$Grupo.x))
#desviacion
boxplot(Hum_VegFAPAR$sd.x  ~ as.factor(Hum_VegFAPAR$Grupo.x))
#Graico lineas 21, 23, 25

