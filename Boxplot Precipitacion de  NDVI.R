library(raster)

precipindvi <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaPrecipitacion_para_ndvi.csv") 
humtopo <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

#Correlación de Precipitación y NDVI Topo
Preci_hum <- (merge(precipindvi, humtopo, by = 'X'))
correpnn <- cor(Preci_hum$mean.x, Preci_hum$mean.y, method = c("pearson"))

#Correlación de Precipitación y NDVI Cobertu
Precobernd <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaPrecipitacionparaNDVI_CoberVeg.csv")
ssmcobernd <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaHumedad_CoberturaVeg_de_NDVICORREGIDA.csv")

Preci_humc <- (merge(Precobernd, ssmcobernd, by = 'X'))
correpnnc <- cor(Preci_humc$mean.x, Preci_humc$mean.y, method = c("pearson"))


#Primera iteracion de solape de Precipitación

#Comportamiento de la precipitación en cada grupo topografico
boxplot(Preci_hum$mean.x, Preci_hum$sd.x, Preci_hum$min.x, Preci_hum$max.x, Preci_hum$media.x)
#media
boxplot(Preci_hum$mean.x  ~ as.factor(Preci_hum$Grupo.x))
#desviacion
boxplot(Preci_hum$sd.x  ~ as.factor(Preci_hum$Grupo.x))

# Grafico de las linea 13, 15, 17


#Segunda iteracion de solape de Precipitación 

#Correlacion topo
precipindviSt <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaSOLAPEPrecipitacion_para_ndvi.csv")
  
#Correlación de Precipitación y NDVI
PreciS_hum <- (merge(precipindviSt, humtopo, by = 'X'))
correpnns <- cor(PreciS_hum$mean.x, PreciS_hum$mean.y, method = c("pearson"))


#Correlacion cobertura
precipindviS <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaSOLAPEPreci_NDVI_CoberVeg.csv")

#Correlación de Precipitación y NDVI
PreciS_humc <- (merge(precipindviS, ssmcobernd, by = 'X'))
correpnns <- cor(PreciS_humc$mean.x, PreciS_humc$mean.y, method = c("pearson"))

#Segunda iteracion de solape de Precipitación

#Comportamiento de la segunda iteracion de precipitación en cada grupo topografico
boxplot(PreciS_hum$mean.x, PreciS_hum$sd.x, PreciS_hum$min.x, PreciS_hum$max.x, PreciS_hum$media.x)
#media
boxplot(PreciS_hum$mean.x  ~ as.factor(PreciS_hum$Grupo.x))
#desviacion
boxplot(PreciS_hum$sd.x  ~ as.factor(PreciS_hum$Grupo.x))

# Grafico de las linea 33, 35, 37

