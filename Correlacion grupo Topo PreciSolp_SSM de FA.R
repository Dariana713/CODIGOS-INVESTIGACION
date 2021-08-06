
library(raster)
library(rasterVis)
humtopoFa <- read.csv("Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tabla humedad y grupo topografico/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")

PRECSOLFAPAR<- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaSOLAPEPrecipitacionparaFAPAR.csv")

str(PRECSOLFAPAR)
str(humtopoFa)
PRECSOLFAPAR$X <- row.names(vegndvitopo)
humtopoFa$X <- row.names(humtopoFa)


#head(merge(vegndvitopo, humtopoFa, by = 'X'))
#str(merge(vegndvitopo, humtopoFa, by = 'X'))


PreciS_humF <- (merge(PRECSOLFAPAR, humtopoFa, by = 'X'))
correps <- cor(PreciS_humF$mean.x, PreciS_humF$mean.y, method = c("pearson"))

#Comportamiento de la precipitacion con solape (5 dias antes y despues de los dias de SSM) en cada grupo topografico
#media
boxplot(PreciS_humF$mean.x  ~ as.factor(PreciS_humF$Grupo.x))
#desviacion
boxplot(PreciS_humF$sd.x  ~ as.factor(PreciS_humF$Grupo.x))
#min
boxplot(PreciS_humF$min.x  ~ as.factor(PreciS_humF$Grupo.x))
#max
boxplot(PreciS_humF$max.x  ~ as.factor(PreciS_humF$Grupo.x))

splom(PreciS_humF)

