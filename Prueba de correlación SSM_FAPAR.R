
require(raster)
library(mapview)

setwd("~/Codigos Inves_DIAV/FAPAR/36 DIAS DE FAPAR")
sfapar <- stack(list.files(pattern = ".tif"))


setwd("~/Codigos Inves_DIAV/FAPAR/Humedades para FAPAR")
sSSM <- stack(list.files(pattern = ".tif"))

rstack <- stack(sSSM, sfapar)
plot(rstack)


system.time(cg1 <- gridcorts(rasterstack = rstack, method = "spearman", type = "both"))

writeRaster(cg1 , file="PIXEL_CORRELATIO_SSM_FAPAR.tif")
saveRDS(as(cg1, 'SpatialPixelsDataFrame'), file='PIXEL_CORRELATIO_SSM_FAPAR.rds')


#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg <- cg1
neg[neg > -0.4] <- NA
pos <- cg1
pos[pos < 0.4] <- NA
plot(pos[[1]])
mapview(pos[[1]])
plot(neg[[1]])
mapview(neg[[1]])
dim(na.omit(as.data.frame(pos[[1]])))
dim(na.omit(as.data.frame(neg[[1]])))
summary(neg)

#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg <- cg1
neg[neg > -0.7] <- NA
pos <- cg1
pos[pos < 0.7] <- NA
plot(pos[[1]])
plot(neg[[1]])
dim(na.omit(as.data.frame(pos[[1]])))
dim(na.omit(as.data.frame(neg[[1]])))
summary(neg)


#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg <- cg1
neg[neg > -0.9] <- NA
pos <- cg1
pos[pos < 0.9] <- NA
plot(pos[[1]])
mapview(pos[[1]])
plot(neg[[1]])
mapview(neg[[1]])
dim(na.omit(as.data.frame(pos[[1]])))
dim(na.omit(as.data.frame(neg[[1]])))
summary(neg)













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