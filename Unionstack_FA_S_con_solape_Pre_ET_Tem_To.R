library(raster)
library(mapview)
library(rgdal)


setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
fapar <- stack(list.files(pattern = ".tif"))
plot(fapar)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Datos de precipitacion FAPAR P ACUMULADA 5 dias antes y despues SSM")
Pre <- stack(list.files(pattern = ".tif"))
plot(Pre)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
humedad <- stack(list.files(pattern = ".tif"))
plot(humedad)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 TEMFA ESP")
Temperatura <- stack(list.files(pattern = ".tif"))
plot(Temperatura)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 ETFA ESP")
Evapotranspitación <- stack(list.files(pattern = ".tif"))
plot(Evapotranspitación)

Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")


Unionfapars <- stack(fapar, humedad, Pre, Evapotranspitación, Temperatura, Topografic)
p <- as(Unionfapars, 'SpatialPixelsDataFrame')
saveRDS(p, file='base_completa_fapar_ssm_pre_solape5diasantes_ET_Tem_topo.rds')
