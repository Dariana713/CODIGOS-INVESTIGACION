#Analisis para el comportamiento de FAPAR
library(raster)

# Espacios Naturales protegidos de España
EspacioProtegidos <- shapefile("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Zona de Estudio/enp.shp")
EspacioProtegidos <- spTransform(EspacioProtegidos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(EspacioProtegidos)
plot(EspacioProtegidos)

#Cuencas
CuencasESP <- shapefile("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Zona de Estudio/Cuencas de España/Cuencas de España.shp")
CuencasESP <- spTransform(EspacioProtegidos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(CuencasESP)
plot(CuencasESP)

#Correlacion de humedad y Fapar

dat <- readRDS("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_ET_Temp_topo.rds")
corr <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corr[i] <- cor(df$x, df$y)
}
res <- data.frame(day=1:36, correlations = corr, main="Correlación SSM y FAPAR")
plot(res, col='white', ylim=c(-0.5, 0.5))
lines(res)
abline(h=0)

#plot(x=dat@data[,36+i], y=dat@data[,i], main="Scatterplot Example", xlab="SSM ", ylab="NDVI ")





#Correlcion de precipitacion (x) y humedad (y)
#df <- na.omit(data.frame(x=dat@data[,i+36], y=dat@data[,i+72]))
dat <- readRDS("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_topo.rds")
corr <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,i+72], y=dat@data[,i+36]))
  corr[i] <- cor(df$x, df$y)
}
res <- data.frame(day=1:36, correlations = corr)
plot(res, col='white', ylim=c(-0.5, 0.5))
lines(res)
abline(h=0)



dat_topo3 <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corr <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3[,i+36], y=dat_topo3[,i+72]))
  corr[i] <- cor(df$x, df$y)
}
res_topo3  <- data.frame(day=1:36, correlations = corr)
lines(res_topo3, col='blue')

dat_topo3 <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corr <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3[,i], y=dat_topo3[,36+i]))
  corr[i] <- cor(df$x, df$y)
}
res_topo3  <- data.frame(day=1:36, correlations = corr)

lines(res_topo3, col='orange')




fapar <- dat@data[grep('FAPAR', names(dat@data))]
fapar 