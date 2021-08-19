library(raster)
library(mapview)
library(rgdal)

#----------------------------------------------------------------

# 1. Variables
setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36N dias de NDVI con mascara de cobertura")
ndvi <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias Precipitación Acumulada en base a SSM con máscara Cobertura")
Pre <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias SSM")
humedad <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12 TEMPN ESP")
TemperaturaN <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12_ETN ESP")
EvapotranspitaciónN <- stack(list.files(pattern = ".tif"))

Topografic <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")


# 2. Grupos de coberturas
CoberturaBosque <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/cOBERTURAS EN FORMATO RASTER/CoberturaRaster_bosque_ESP.tif")
CoberturaMatorral <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/cOBERTURAS EN FORMATO RASTER/CoberturaRaster_matorral_ESP.tif")
CoberturaPastizal <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/cOBERTURAS EN FORMATO RASTER/CoberturaRaster_pastizal_ESP.tif")
CoberturaVegEscaza <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/cOBERTURAS EN FORMATO RASTER/CoberturaRaster_Vegetacion_escasa_ESP.tif")

#Uniones para grupos topograficos 
UnionNDVIs <- stack(ndvi, humedad, Pre, EvapotranspitaciónN, TemperaturaN, Topografic)
b <- as(UnionNDVIs, 'SpatialPixelsDataFrame')
saveRDS(b, file='base_completa_ndvi_ssm_pre_ET_Tem_topo.rds')

#----------------------------GRUPOS DE COBERTURA

# Uniones Grupos de coberturas 
UnionNDVIcob <- stack(ndvi, humedad, Pre, EvapotranspitaciónN, TemperaturaN, CoberturaBosque, CoberturaMatorral, CoberturaPastizal, CoberturaVegEscaza)
unicober <- as(UnionNDVIcob, 'SpatialPixelsDataFrame')
saveRDS(unicober, file='base_completa_ndvi_ssm_pre_ET_Tem_4Coberturascompletassintopo.rds')

# Mascara de todas las variables por grupos de cobertura
#
Mascaratodas_Bosques = mask(UnionNDVIs, CoberturaBosque)
plot(Mascaratodas_Bosques)
Mascaratodas_Matorral= mask(UnionNDVIs, CoberturaMatorral)
Mascaratodas_Pastizal= mask(UnionNDVIs, CoberturaPastizal)
Mascaratodas_VegEsca= mask(UnionNDVIs, CoberturaVegEscaza)

# RDS de mascara coberturas completas
UnioBosque <- as(Mascaratodas_Bosques, 'SpatialPixelsDataFrame')
saveRDS(UnioBosque, file='base_completa_ndvi_ssm_pre_ET_Tem_topo_UnionconmaskBosque.rds')
UnioMatorral <- as(Mascaratodas_Matorral, 'SpatialPixelsDataFrame')
saveRDS(UnioMatorral, file='base_completa_ndvi_ssm_pre_ET_Tem_topo_UnionconmaskMatorral.rds')
Unionpastiza <- as(Mascaratodas_Pastizal, 'SpatialPixelsDataFrame')
saveRDS(Unionpastiza, file='base_completa_ndvi_ssm_pre_ET_Tem_topo_UnionconmaskPastizal.rds')
UnionVegEsa <- as(Mascaratodas_VegEsca, 'SpatialPixelsDataFrame')
saveRDS(UnionVegEsa, file='base_completa_ndvi_ssm_pre_ET_Tem_topoUnionconmaskVegEsca.rds')

