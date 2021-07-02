require(raster)
library(mapview)

setwd("~/Codigos Inves_DIAV/FAPAR/Humedades para FAPAR")
sSSM <- stack(list.files(pattern = ".tif"))

setwd("~/Codigos Inves_DIAV/Mask Cobertura Kmeas Topografic")
sgRUPOtOPO <- stack(list.files(pattern = ".tif"))


rstack <- stack(sgRUPOtOPO, sSSM)
plot(rstack)


system.time(cg1 <- gridcorts(rasterstack = rstack, method = "spearman", type = "both"))

writeRaster(cg1 , file="PIXEL_CORRELATIO_gRUPOtOPO_sSSM_FAPAR.tif")
saveRDS(as(cg1, 'SpatialPixelsDataFrame'), file='PIXEL_CORRELATIO_gRUPOtOPO_sSSM_FAPAR.tif.rds')


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


