library(raster)
library(mapview)
library(rgdal)

setwd("~/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
fapar <- stack(list.files(pattern = ".tif"))
plot(fapar)

setwd("~/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/FAPAR/12 TEMFA ESP")
Temperatura <- stack(list.files(pattern = ".tif"))
plot(Temperatura)

setwd("~/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/FAPAR/Datos de precipitacion FAPAR P ACUMULADA 5 dias antes y despues SSM")
PreS <- stack(list.files(pattern = ".tif"))
plot(PreS)

setwd("~/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
humedad <- stack(list.files(pattern = ".tif"))
plot(humedad)


setwd("~/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/FAPAR/12 ETFA ESP")
Evapotranspitación <- stack(list.files(pattern = ".tif"))
plot(Evapotranspitación)

Topografic <- raster("C:/Users/DIAVIVEL/Documents/CARPETA DE TRABAJO ACTUALIZADA AL DIA - copia/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

Unionfapars <- stack(fapar, humedad, PreS, Evapotranspitación, Temperatura, Topografic)
p <- as(Unionfapars, 'SpatialPixelsDataFrame')
saveRDS(p, file='base_completa_fapar_ssm_pre_solape5diasantes_ET_Tem_topo.rds')


#Mascara de valores
rstack2 <- stack(fapar, humedad)
system.time(cg11 <- gridcorts(rasterstack = rstack2, method = "pearson", type = "both"))
cormap <- cg11[[1]]
cormapneg <- cormap      
cormapneg[cormapneg < -0.5] <- NA
cormapos <- cormap
cormapos[cormapos < 0.5] <- NA
# Hacer el Stack
UnionFapar <- stack(fapar, humedad, PreS, Evapotranspitación, Temperatura, Topografic)
UnionFaparPositivo = mask(UnionFapar, cormapneg)
UnionFaparNegativo= mask(UnionFapar, cormapos)
plot(UnionFaparPositivo)
plot(UnionFaparNegativo)

d <- as(UnionFaparPositivo, 'SpatialPixelsDataFrame')
saveRDS(d, file='base_completa_fapar_ssm_PREsolape5diasantes_ET_Tem_topoPOSITIVO.rds')
b <- as(UnionFaparNegativo, 'SpatialPixelsDataFrame')
saveRDS(b, file='base_completa_fapar_ssm_presolape5diasantes_ET_Tem_topoNEGATIVO.rds')


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
