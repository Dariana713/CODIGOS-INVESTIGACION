library(raster)


#Abrir los CSV de tabla NDVI y tabla Humedad
vegndvitopo <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/144_TablaEstadisticaNDVI_GrupoTopo.csv")
humtopo <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

#TABLAS CSV Cobeertura
VEGCOBERND <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas cobertura/TablaEstadisticaNDVI_CoberturaVeg.csv")
SSMCOBERND <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaHumedad_CoberturaVeg_de_NDVICORREGIDA.csv")

# Cálculo de correlación topo
Hum_Veg <- (merge(humtopo, vegndvitopo, by = 'X'))
correT <- cor(Hum_Veg$mean.x, Hum_Veg$mean.y, method = c("pearson"))

#Calculo correlacion Cober 
Hum_VegCoBER <- (merge(SSMCOBERND, VEGCOBERND, by = 'X'))
correC <- cor(Hum_VegCoBER$mean.x, Hum_VegCoBER$mean.y, method = c("pearson"))


#Comportamiento del NDVI en cada grupo topografico
Summary(vegndvitopo)
boxplot(Hum_Veg$mean.y, Hum_Veg$sd.y, Hum_Veg$min.y, Hum_Veg$max.y, Hum_Veg$median.y)
#media
boxplot(Hum_Veg$mean.y ~ as.factor(Hum_Veg$Grupo.y))
#desviacion
boxplot(Hum_Veg$sd.y  ~ as.factor(Hum_Veg$Grupo.y))

#Hacer gráfico de estas de las líneas 14, 16, 18

# Comportamiento de la humedad en cada grupo topografico
boxplot(Hum_Veg$mean.x, Hum_Veg$sd.x, Hum_Veg$min.x, Hum_Veg$max.x, Hum_Veg$median.x )
#media
boxplot(Hum_Veg$mean.x  ~ as.factor(Hum_Veg$Grupo.x))
#desviacion
boxplot(Hum_Veg$sd.x  ~ as.factor(Hum_Veg$Grupo.x))

#Hacer gráfico de estas de las líneas 23, 25, 27


#Esto es para mostrar en word
#Abrir los CSV de tabla NDVI y tabla Humedad
NDVI <- read.csv("TablaEstadisticaNDVI_GrupoTopo.csv")
Humedad_SSM <- read.csv("TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

# Cálculo de correlación 
SSM_NDVI <- (merge(Humedad_SSM , NDVI, by = 'X'))
correT <- cor(SSM_NDVI$mean.x, SSM_NDVI$mean.y, method = c("pearson"))

#Calculo correlacion Cober 
Hum_VegCoBER <- (merge(SSMCOBERND, VEGCOBERND, by = 'X'))
correC <- cor(Hum_VegCoBER$mean.x, Hum_VegCoBER$mean.y, method = c("pearson"))



