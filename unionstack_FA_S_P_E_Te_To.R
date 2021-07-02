library(raster)
library(mapview)
library(rgdal)


setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 TEMFA ESP")
Temperatura <- stack(list.files(pattern = ".tif"))
plot(Temperatura)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
fapar <- stack(list.files(pattern = ".tif"))
plot(fapar)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 ETFA ESP")
Evapotranspitación <- stack(list.files(pattern = ".tif"))
plot(Evapotranspitación)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Dato de precipitación para FAPAR")
Pre <- stack(list.files(pattern = ".tif"))
plot(Pre)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
humedad <- stack(list.files(pattern = ".tif"))
plot(humedad)

Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")


Unionfapar <- stack(fapar, humedad, Pre, Evapotranspitación, Temperatura, Topografic)
x <- as(Unionfapar, 'SpatialPixelsDataFrame')
saveRDS(x, file='base_completa_fapar_ssm_pre_ET_Temp_topo.rds')
