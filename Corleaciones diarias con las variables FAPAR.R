#Analisis para el comportamiento de FAPAR
library(raster)

# Espacios Naturales protegidos de Espa�a
EspacioProtegidos <- shapefile("C:/Users/Usuario/Documents/An�lisis de Tesis en Rstudio y SAGA GIS/Zona de Estudio/enp.shp")
EspacioProtegidos <- spTransform(EspacioProtegidos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(EspacioProtegidos)
plot(EspacioProtegidos)

#Cuencas
CuencasESP <- shapefile("C:/Users/Usuario/Documents/An�lisis de Tesis en Rstudio y SAGA GIS/Zona de Estudio/Cuencas de Espa�a/Cuencas de Espa�a.shp")
CuencasESP <- spTransform(EspacioProtegidos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(CuencasESP)
plot(CuencasESP)

#Correlacion de humedad y Fapar

dat <- readRDS("C:/Users/Usuario/Documents/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Uni�n para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_ET_Temp_topo.rds")
corrf <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corrf[i] <- cor(df$x, df$y)
}
res <- data.frame(D�a=1:36, Correlaci�n = corrf)
plot(res, col='white', ylim=c(-0.5, 0.5), main="Correlaci�n SSM y FAPAR")
lines(res)
abline(h=0)

#plot(x=dat@data[,36+i], y=dat@data[,i], main="Scatterplot Example", xlab="SSM ", ylab="NDVI ")

#Grupo 1 de correlacion humedad y FAPAR
dat_topo1n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1, ]
corrf1 <- numeric()
for (i in 1:36){
  dfn1 <- na.omit(data.frame(x=dat_topo1n[,36+i], y=dat_topo1n[,i]))
  corrf1[i] <- cor(df$x, df$y)
}
res_topo1n  <- data.frame(D�as=1:36, Correlaci�n = corrf1)

lines(res_topo1n, col='aquamarine4')


#Grupo 2 de correlacion humedad y FAPAR

dat_topo2n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrf2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2n[,36+i], y=dat_topo2n[,i]))
  corrf2[i] <- cor(df$x, df$y)
}
res_topo2n  <- data.frame(day=1:36, correlations = corrf2)

lines(res_topo2n, col='orange')


#Grupo 3 de correlacion humedad y FAPAR

dat_topo3n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrf3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3n[,36+i], y=dat_topo3n[,i]))
  corrf3[i] <- cor(df$x, df$y)
}
res_topo3n  <- data.frame(day=1:36, correlations = corrf3)
lines(res_topo3n, col='blue')



#Grupo 4 de correlacion humedad y FAPAR

dat_topo4n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4, ]
corrf4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4n[36+i], y=dat_topo4n[,i]))
  corrf4[i] <- cor(df$x, df$y)
}
res_topo4n <- data.frame(day=1:36, correlations = corrf4)

lines(res_topo4n, col='bisque')



#Correlcion de precipitacion (x) y humedad (y)
#df <- na.omit(data.frame(x=dat@data[,i+36], y=dat@data[,i+72]))
corr <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,i+72], y=dat@data[,i+36]))
  corr[i] <- cor(df$x, df$y)
}
res <- data.frame(day=1:36, correlations = corr)
plot(res, col='white', ylim=c(-0.5, 0.5))
lines(res)
abline(h=0)

#Grupo 1 de correlacion Precipitacion con humedad 
dat_topo1p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1,]
corrp1 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo1p[,i+72], y=dat_topo1p[,i+36]))
  corrp1[i] <- cor(df$x, df$y)
}
res_topo1p  <- data.frame(day=1:36, correlations = corrp1)

lines(res_topo1p, col='aquamarine4' )


#Grupo 2 de correlacion Precipitacion con humedad 

dat_topo2p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrp2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2p[,i+72], y=dat_topo2p[,i+36]))
  corrp2[i] <- cor(df$x, df$y)
}
res_topo2p  <- data.frame(day=1:36, correlations = corrp2)

lines(res_topo2p, col='orange')

#Grupo 3 de correlacion Precipitacion con humedad 

dat_topo3p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrp3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3p[,i+72], y=dat_topo3p[,i+36]))
  corrp3[i] <- cor(df$x, df$y)
}
res_topo3p <- data.frame(day=1:36, correlations = corrp3)
lines(res_topo3p, col='blue')

#Grupo 4 de correlacion Precipitacion con humedad 

dat_topo4p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4,]
corrp4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4[,i+72], y=dat_topo4[,i+36]))
  corrp4[i] <- cor(df$x, df$y)
}
res_topo4p  <- data.frame(day=1:36, correlations = corrp4)

lines(res_topo4p, col='bisque')





fapar <- dat@data[grep('FAPAR', names(dat@data))]
fapar 