library(raster)

precipiFA <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaPrecipitacionparaFAPAR.csv")
humtopFAP <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")

#Correlación Topo
Preci_humFAP <- (merge(precipiFA, humtopFAP, by = 'X'))
correp <- cor(Preci_humFAP$mean.x, Preci_humFAP$mean.y, method = c("pearson"))

#Correlacion cOBERTURA
precipiFAC <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaPrecipitacionparaFAPAR_CoberVeg.csv")
humtopFAPC <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaEstadisticaHumedad_CoberturaVeg_de_FAPARCORREGIDA.csv")

#Correlación Topo
Preci_humFAPC <- (merge(precipiFAC, humtopFAPC, by = 'X'))
correp <- cor(Preci_humFAPC$mean.x, Preci_humFAPC$mean.y, method = c("pearson"))


# Primera iteracion de la precipitacion en cada grupo topografico
boxplot(Preci_humFAP$mean.x, Preci_humFAP$sd.x, Preci_humFAP$min.x, Preci_humFAP$max.x, Preci_humFAP$median.x)
#media
boxplot(Preci_humFAP$mean.x  ~ as.factor(Preci_humFAP$Grupo.x))
#desviacion
boxplot(Preci_humFAP$sd.x  ~ as.factor(Preci_humFAP$Grupo.x))



#segunda Iteración de Precipitación 
PRECSOLFAPAR<- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaSOLAPEPrecipitacionparaFAPAR.csv")

#Correlación de Precipitación y FAPAR Topo
PreciS_humF <- (merge(PRECSOLFAPAR, humtopFAP, by = 'X'))
correps <- cor(PreciS_humF$mean.x, PreciS_humF$mean.y, method = c("pearson"))

#segunda Iteración de Precipitación COBERTURA 
PRECSOLFAPAR<- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaSOLAPEPreci_FAPAR_CoberVeg.csv")

#Correlación de Precipitación y FAPAR
PreciS_humFC <- (merge(PRECSOLFAPAR, humtopFAPC, by = 'X'))
correps <- cor(PreciS_humFC$mean.x, PreciS_humFC$mean.y, method = c("pearson"))

#Comportamiento de segunda iteracion de la precipitacion en cada grupo topografico
boxplot(PreciS_humF$mean.x, PreciS_humF$sd.x, PreciS_humF$min.x, PreciS_humF$max.x, PreciS_humF$median.x)
#media
boxplot(PreciS_humF$mean.x  ~ as.factor(PreciS_humF$Grupo.x))
#desviacion
boxplot(PreciS_humF$sd.x  ~ as.factor(PreciS_humF$Grupo.x))