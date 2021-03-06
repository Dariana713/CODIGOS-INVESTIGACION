library(raster)
library(mapview)
library(rgdal)


setwd("~/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Uni�n para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
fapar <- stack(list.files(pattern = ".tif"))
plot(fapar)

setwd("~/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Uni�n para hacer un rds y correlaciones/FAPAR/Datos de precipitacion FAPAR P ACUMULADA 5 dias antes y despues SSM")
Pre <- stack(list.files(pattern = ".tif"))
plot(Pre)

setwd("~/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Uni�n para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
humedad <- stack(list.files(pattern = ".tif"))
plot(humedad)

Topografic <- raster("C:/Users/Usuario/Documents/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Uni�n para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")


Unionfapar <- stack(fapar, humedad, Pre,  Topografic)
x <- as(Unionfapar, 'SpatialPixelsDataFrame')
saveRDS(x, file='base_completa_fapar_ssm_pre_solape5diasantes_topo.rds')
