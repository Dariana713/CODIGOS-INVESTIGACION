library(raster)
library(mapview)
library(rgdal)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36N dias de NDVI con mascara de cobertura")
ndvi <- stack(list.files(pattern = ".tif"))

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias de precipitacion Acumulada 5 dias antes y durantes de SSM")
Pres <- stack(list.files(pattern = ".tif"))

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias SSM")
humedad <- stack(list.files(pattern = ".tif"))

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12 TEMPN ESP")
TemperaturaN <- stack(list.files(pattern = ".tif"))
plot(TemperaturaN)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12_ETN ESP")
EvapotranspitaciónN <- stack(list.files(pattern = ".tif"))
plot(EvapotranspitaciónN)

Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

UnionNDVIs <- stack(ndvi, humedad, Pres, EvapotranspitaciónN, TemperaturaN, Topografic)
b <- as(UnionNDVIs, 'SpatialPixelsDataFrame')
saveRDS(b, file='base_completa_ndvi_ssm_pre_solape5diasantes_ET_Tem_topo.rds')
