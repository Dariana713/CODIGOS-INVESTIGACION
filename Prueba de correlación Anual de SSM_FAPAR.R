library(raster)
library(mapview)
library(rgdal)
library(rasterVis)
library(RStoolbox)

setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
sfapar <- stack(list.files(pattern = ".tif"))


setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
sSSM <- stack(list.files(pattern = ".tif"))

rstack <- stack(sSSM, sfapar)
plot(rstack)


system.time(cg1 <- gridcorts(rasterstack = rstack, method = "pearson", type = "both"))

#writeRaster(cg1 , file="PIXEL_CORRELATIO_SSM_FAPAR.tif")
#saveRDS(as(cg1, 'SpatialPixelsDataFrame'), file='PIXEL_CORRELATIO_SSM_FAPAR.rds')

# CONSULTA SOBRE MAPAEO
#negrat <- levels(neg1)[[1]]
#levels(neg1) <- negrat
#levelplot(neg1[[1]], col.regions=c('bisque', 'aliceblue', 'palegreen', 'midnightblue', 'indianred1','orange'))

#pRUEBAS DE RANGOS DE CORRELACION
#¿Como calcular el del cero (0)
df <- as.data.frame(cg1[[1]])
areatotal <- dim(na.omit(df))
neuto <- cg1
neuto[neuto < 0] <- NA
mapview(neuto[[1]])
plot(neuto[[1]])
Corrneu0 <- dim(na.omit(as.data.frame(neuto[[1]])))
summary(neuto)
df0 <- data.frame( Corrneu0=Corrneu0,  AreaTotal=areatotal, variable="Correlacion_neutra")



#pRUEBAS DE RANGOS DE CORRELACION

neg1 <- cg1
neg1[neg1 > -0.1] <- NA
pos1 <- cg1
pos1[pos1 < 0.1] <- NA
plot(pos1[[1]])
mapview(pos1[[1]])
plot(neg1[[1]])
mapview(neg1[[1]])
Canpos1<- dim(na.omit(as.data.frame(pos1[[1]])))
Canneg1 <- dim(na.omit(as.data.frame(neg1[[1]])))
df01 <- data.frame( Corrpos=Canpos1, corrnes=Canneg1, AreaTotal=areatotal, variable="Correlacion_mas_menos01")


#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg2 <- cg1
neg2[neg2 > -0.3] <- NA
pos2 <- cg1
pos2[pos2 < 0.3] <- NA
plot(pos2[[1]])
mapview(pos2[[1]])
plot(neg2[[1]])
mapview(neg2[[1]])
Canpos2 <- dim(na.omit(as.data.frame(pos2[[1]])))
Canneg2 <- dim(na.omit(as.data.frame(neg2[[1]])))
df02 <- data.frame( Corrpos=Canpos2, corrnes=Canneg2, AreaTotal=areatotal, variable="Correlacion_mas_menos03")


#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg3 <- cg1
neg3[neg3 > -0.5] <- NA
pos3 <- cg1
pos3[pos3 < 0.5] <- NA
plot(pos3[[1]])
mapview(pos3[[1]])
plot(neg[[1]])
mapview(neg3[[1]])
Canpos3 <- dim(na.omit(as.data.frame(pos3[[1]])))
Canneg3 <- dim(na.omit(as.data.frame(neg3[[1]])))
df03 <- data.frame( Corrpos=Canpos3, corrnes=Canneg3, AreaTotal=areatotal, variable="Correlacion_mas_menos05")


#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg4 <- cg1
neg4[neg4 > -0.7] <- NA
pos4 <- cg1
pos4[pos4 < 0.7] <- NA
plot(pos4[[1]])
mapview(pos4[[1]])
plot(neg4[[1]])
mapview(neg4[[1]])
Canpos4 <- dim(na.omit(as.data.frame(pos4[[1]])))
Canneg4 <- dim(na.omit(as.data.frame(neg4[[1]])))
df04 <- data.frame( Corrpos=Canpos4, corrnes=Canneg4, AreaTotal=areatotal, variable="Correlacion_mas_menos07")

#pRUEBAS DE RANGOS DE CORRELACION

df <- as.data.frame(cg1[[1]])
dim(na.omit(df))
neg5 <- cg1
neg5[neg5 > -0.9] <- NA
pos5 <- cg1
pos5[pos5 < 0.9] <- NA
plot(pos5[[1]])
mapview(pos5[[1]])
plot(neg5[[1]])
mapview(neg5[[1]])
Canpos5 <- dim(na.omit(as.data.frame(pos5[[1]])))
Canneg5 <- dim(na.omit(as.data.frame(neg5[[1]])))
df05 <- data.frame( Corrpos=Canpos5, corrnes=Canneg5, AreaTotal=areatotal, variable="Correlacion_mas_menos09")

unionTabla1 <- rbind(df01, df02, df03, df04, df05)
unionTabla1 <-unionTabla1[c(-2, -4, -6, -8, -10),]
write.csv(unionTabla1, file ="Correlaciones_anuales_SSMyFAPAR.csv")











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