library(raster)
library(rasterVis)

vegFAPARtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/144_TablaEstadisticaFAPAR_GrupoTopo.csv")
humtopoF <- read.csv("Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tabla humedad y grupo topografico/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")

str(vegFAPARtopo)
str(humtopoF)
vegndvitopo$X <- row.names(vegFAPARtopo)
humtopo$X <- row.names(humtopoF)


#head(merge(vegndvitopo, humtopo, by = 'X'))
#str(merge(vegndvitopo, humtopo, by = 'X'))


Hum_VegFAPAR <- (merge(humtopoF, vegFAPARtopo, by = 'X'))
corre <- cor(Hum_VegFAPAR$mean.x, Hum_VegFAPAR$mean.y, method = c("pearson"))
correM <- cor(Hum_VegFAPAR$max.x, Hum_VegFAPAR$max.y, method = c("pearson"))
corremi <- cor(Hum_VegFAPAR$min.x, Hum_VegFAPAR$min.y, method = c("pearson"))

#Comportamiento de la humedad en cada grupo topografico
#media
boxplot(Hum_VegFAPAR$mean.x  ~ as.factor(Hum_VegFAPAR$Grupo.x))
#desviacion
boxplot(Hum_VegFAPAR$sd.x  ~ as.factor(Hum_VegFAPAR$Grupo.x))
#min
boxplot(na.omit(Hum_VegFAPAR$min.x  ~ as.factor(Hum_VegFAPAR$Grupo.x)))
#max
boxplot(na.omit(Hum_VegFAPAR$max.x  ~ as.factor(Hum_VegFAPAR$Grupo.x)))


#Comportamiento del FAPAR en cada grupo topografico
#media
boxplot(Hum_VegFAPAR$mean.y ~ as.factor(Hum_VegFAPAR$Grupo.y))
#desviacion
boxplot(Hum_VegFAPAR$sd.y  ~ as.factor(Hum_VegFAPAR$Grupo.y))
#min
boxplot(Hum_VegFAPAR$min.y  ~ as.factor(Hum_VegFAPAR$Grupo.y))
#max
boxplot(Hum_VegFAPAR$max.y  ~ as.factor(Hum_VegFAPAR$Grupo.y))
