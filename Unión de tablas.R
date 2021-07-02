library(raster)
#vegtopo$IDENTIFICADOR <- row.names(vegtopo)
#humtopo$IDENTIFICADOR <- row.names(humtopo)
#mer <- merge(vegtopo, humtopo, by='IDENTIFICADOR')
#mer <- merge(mer, prectopo, by='IDENTIFICADOR')20:37
#mer <- merge(mer, prectopo, by='IDENTIFICADOR')

#Para 
#str(vegtopo)




vegtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas/NDVI/Tablas UNIDAS de Grupo Topo y NDVI/144_TablaEstadisticaGrupoTopo NDVI.csv", sep=";")

humtopo <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas/NDVI/Tablas_unidasGrupos_topo_Humedad_NDVI/Tablas_unidasGrupos_topo_Humedad_NDVI.csv", sep=";")


vegtopo$meanveg <- as.numeric(gsub(",", ".", vegtopo$meanveg))
str(vegtopo)

humtopo$meanhum <- as.numeric(gsub(",", ".", humtopo$meanhum))
str(humtopo)

vegtopo$ID <- row.names(vegtopo)
humtopo$ID <- row.names(humtopo)
head(merge(vegtopo, humtopo, by = 'ID'))
str(merge(vegtopo, humtopo, by = 'ID'))
vegtopo$meanveg <- as.numeric(gsub(",", ".", vegtopo$sd))
str(vegtopo)
humtopo$meanhum <- as.numeric(gsub(",", ".", humtopo$sd))
str(humtopo)
str(merge(vegtopo, humtopo, by = 'ID'))
Veg_hum_mean <- (merge(vegtopo, humtopo, by = 'ID'))

boxplot(Veg_hum_mean$meanhum ~ as.factor(Veg_hum_mean$variable.x) )
boxplot(Veg_hum_mean$meanhum ~ as.factor(Veg_hum_mean$variable.y) )
boxplot(Veg_hum_mean$meanhum ~ as.factor(Veg_hum_mean$Grupo.y) )
plot(Veg_hum_mean$meanhum, Veg_hum_mean$meanveg)
summary(Veg_hum_mean)
round(Veg_hum_mean$meanhum, 2)






FAPAR_dia1 <- read.csv("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas sin Unir/FAPAR/Tablas SIN UNIR de Grupos topografico con Humedad FAPAR/1.csv")
     
saveRDS(vegtopo, file='vegtopo.rds')