
library(raster)
library(mapview)

# Espacios Naturales protegidos de España

EspacioProtegidos <- shapefile("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Zona de Estudio/enp.shp")
EspacioProtegidos <- spTransform(EspacioProtegidos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(EspacioProtegidos)
plot(EspacioProtegidos)


#Correlacion de SSM y NDVI revisar el orden de X (ssm) ; Y(ndvi)
dat <- readRDS("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/base_completa_ndvi_ssm_pre_topo.rds")
corrn <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corrn[i] <- cor(df$x, df$y)
}
resn <- data.frame(day=1:36, correlations = corrn)
plot(resn, col='white', ylim=c(-0.5, 0.5))
lines(resn)
abline(h=0)
mapview(dat)

#Grupo 1 de correlacion humedad y NDVI
dat_topo1n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1,]
corrn1 <- numeric()
for (i in 1:36){
  dfn1 <- na.omit(data.frame(x=dat_topo1n[,36+i], y=dat_topo1n[,i]))
  corrn1[i] <- cor(df$x, df$y)
}
res_topo1n  <- data.frame(day=1:36, correlations = corrn1)

lines(res_topo1n, col='aquamarine4')

#Grupo 2 de correlacion Precipitacion con humedad 

dat_topo2n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrn2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2n[,36+i], y=dat_topo2n[,i]))
  corrn2[i] <- cor(df$x, df$y)
}
res_topo2n  <- data.frame(day=1:36, correlations = corrn2)

lines(res_topo2n, col='orange')

#Grupo 3 de correlacion Precipitacion con humedad 

dat_topo3n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrn3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3n[,36+i], y=dat_topo3n[,i]))
  corrn3[i] <- cor(df$x, df$y)
}
res_topo3n  <- data.frame(day=1:36, correlations = corrn3)
lines(res_topo3n, col='blue')

#Grupo 4 de correlacion Precipitacion con humedad 

dat_topo4n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4,]
corrn4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4n[36+i], y=dat_topo4n[,i]))
  corrn4[i] <- cor(df$x, df$y)
}
res_topo4n <- data.frame(day=1:36, correlations = corrn4)

lines(res_topo4n, col='bisque')




#Correlacion de Precipitacion con humedad revisar el orden de X (precipita) ; Y (ssm)
corrp <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,i+72], y=dat@data[,i+36]))
  corrp[i] <- cor(df$x, df$y)
}
resp <- data.frame(day=1:36, correlations = corrp)
plot(resp, col='white', ylim=c(-0.5, 0.5))
lines(resp)
abline(h=0)


#Grupo 1 de correlacion Precipitacion con humedad 
dat_topo1p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1,]
corrp1 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo1p[,i+72], y=dat_topo1p[,i+36]))
  corrp1[i] <- cor(df$x, df$y)
}
res_topo1p  <- data.frame(day=1:36, correlations = corrp1)

lines(res_topo1p, col='aquamarine4')

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

 