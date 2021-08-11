library(raster)
library(mapview)
library(rgdal)

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36N dias de NDVI con mascara de cobertura")
ndvi <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias de precipitacion Acumulada 5 dias antes y durantes de SSM")
Pres <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias SSM")
humedadS <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12 TEMPN ESP")
TemperaturaN <- stack(list.files(pattern = ".tif"))
plot(TemperaturaN)

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12_ETN ESP")
EvapotranspitaciónN <- stack(list.files(pattern = ".tif"))
plot(EvapotranspitaciónN)

Topografic <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

UnionNDVIs <- stack(ndvi, humedadS, Pres, EvapotranspitaciónN, TemperaturaN, Topografic)
t <- as(UnionNDVIs, 'SpatialPixelsDataFrame')
saveRDS(t, file='base_completa_ndvi_ssm_pre_solape5diasantes_ET_Tem_topo.rds')


rstack5 <- stack(humedad,ndvi)
system.time(cg15 <- gridcorts(rasterstack = rstack5, method = "pearson", type = "both"))
cormap <- cg15[[1]]
cormapneg <- cormap      
cormapneg[cormapneg > -0.5] <- NA
plot(cormapneg)
cormapos <- cormap
cormapos[cormapos < 0.5] <- NA
plot(cormapos)
# Hacer el Stack
UnionNDVI <- stack(ndvi, humedadS, Pres, EvapotranspitaciónN, TemperaturaN, Topografic)
UnionNDVIPositivo = mask(UnionNDVI, cormapneg)
UnionNDVINegativo= mask(UnionNDVI, cormapos)

q <- as(UnionNDVIPositivo, 'SpatialPixelsDataFrame')
saveRDS(q, file='base_completa_ndvi_ssm_presolape5diasantes_ET_Tem_topoPOSITIVOCORREGIDO.rds')
x <- as(UnionNDVINegativo, 'SpatialPixelsDataFrame')
saveRDS(x, file='base_completa_ndvi_ssm_presolape5diasantes_ET_Tem_topoNEGATIVOCORREGIDO.rds')



gridcorts <- function(rasterstack, method, type=c("corel","pval","both")){
  # Values for (layers, ncell, ncol, nrow, method, crs, extent) come straight from the input raster stack
  # e.g. nlayers(rasterstack), ncell(rasterstack)... etc.
  print(paste("Start Gridcorts:",Sys.time()))
  print("Loading parameters")
  layers=nlayers(rasterstack);ncell=ncell(rasterstack);
  ncol=ncol(rasterstack);nrow=nrow(rasterstack);crs=crs(rasterstack);
  extent=extent(rasterstack);pb = txtProgressBar(min = 0, max = ncell, initial = 0)
  print("Done loading parameters")
  mtrx <- as.matrix(rasterstack,ncol=layers)
  empt <- matrix(nrow=ncell, ncol=2)
  print("Initiating loop operation")
  if (type == "corel"){
    for (i in 1:ncell){
      setTxtProgressBar(pb,i)
      if (all(is.na(mtrx[i,1:(layers/2)])) | all(is.na(mtrx[i,((layers/2)+1):layers]))){ 
        empt[i,1] <- NA 
      } else 
        if (sum(!is.na(mtrx[i,1:(layers/2)]/mtrx[i,((layers/2)+1):layers])) < 4 ){
          empt[i,1] <- NA 
        } else 
          empt[i,1] <- as.numeric(cor.test(mtrx[i,1:(layers/2)], mtrx[i,((layers/2)+1):layers],method=method)$estimate)
    }
    print("Creating empty raster")
    corel <- raster(nrows=nrow,ncols=ncol,crs=crs)
    extent(corel) <- extent
    print("Populating correlation raster")
    values(corel) <- empt[,1]
    print(paste("Ending Gridcorts on",Sys.time()))
    corel
  } 
  else
    if (type == "pval"){
      for (i in 1:ncell){
        setTxtProgressBar(pb,i)
        if (all(is.na(mtrx[i,1:(layers/2)])) | all(is.na(mtrx[i,((layers/2)+1):layers]))){ 
          empt[i,2] <- NA 
        } else 
          if (sum(!is.na(mtrx[i,1:(layers/2)]/mtrx[i,((layers/2)+1):layers])) < 4 ){
            empt[i,2] <- NA 
          } else 
            empt[i,2] <- as.numeric(cor.test(mtrx[i,1:(layers/2)], mtrx[i,((layers/2)+1):layers],method=method)$p.value)
      }
      pval <- raster(nrows=nrow,ncols=ncol,crs=crs)
      extent(pval) <- extent
      print("Populating significance raster")
      values(pval) <- empt[,2]
      print(paste("Ending Gridcorts on",Sys.time()))
      pval
    }
  else
    if (type == "both"){
      for (i in 1:ncell){
        setTxtProgressBar(pb,i)
        if (all(is.na(mtrx[i,1:(layers/2)])) | all(is.na(mtrx[i,((layers/2)+1):layers]))){ 
          empt[i,] <- NA 
        } else 
          if (sum(!is.na(mtrx[i,1:(layers/2)]/mtrx[i,((layers/2)+1):layers])) < 4 ){
            empt[i,] <- NA 
          } else {
            empt[i,1] <- as.numeric(cor.test(mtrx[i,1:(layers/2)], mtrx[i,((layers/2)+1):layers],method=method)$estimate) 
            empt[i,2] <- as.numeric(cor.test(mtrx[i,1:(layers/2)], mtrx[i,((layers/2)+1):layers],method=method)$p.value)
          }
      }
      c <- raster(nrows=nrow,ncols=ncol,crs=crs)
      p <- raster(nrows=nrow,ncols=ncol,crs=crs)
      print("Populating raster brick")
      values(c) <- empt[,1]
      values(p) <- empt[,2]
      brk <- brick(c,p)
      extent(brk) <- extent
      names(brk) <- c("Correlation","Pvalue")
      print(paste("Ending Gridcorts on",Sys.time()))
      brk
    }
}

