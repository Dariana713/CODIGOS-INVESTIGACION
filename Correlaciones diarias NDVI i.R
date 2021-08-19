library(raster)
library(mapview)
library(rasterVis)
library(ggplot2)

#Correlacion de SSM y NDVI revisar el orden de X (ssm) ; Y(ndvi)
dat <- readRDS("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/base_completa_ndvi_ssm_pre_ET_Tem_topo.rds")
corrn <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corrn[i] <- cor(df)
}
resn <- data.frame(Días=1:36, Correlación = corrn)
plot(resn, col='black', ylim=c(-0.5, 0.8), main="Correlación SSM y NDVI")
lines(resn)
abline(h=0)
plot(df)

#Regresión de SSM y NDVI


ggplot(df)+
  geom_smooth(aes(x=x, y=y, colour = y))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("SSM(%)")+ylab("NDVI") 


#method = "loess"  


#Grupo 1 de correlacion humedad y NDVI
dat_topo1n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1, ]
corrn1 <- numeric()
for (i in 1:36){
  dfn1 <- na.omit(data.frame(x=dat_topo1n[,36+i], y=dat_topo1n[,i]))
  corrn1[i] <- cor(df$x, df$y)
}
res_topo1n  <- data.frame(Días=1:36, Correlación = corrn1)

lines(res_topo1n, col='aquamarine4')


#Grupo 2 de correlacion humedad y NDVI

dat_topo2n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrn2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2n[,36+i], y=dat_topo2n[,i]))
  corrn2[i] <- cor(df$x, df$y)
}
res_topo2n  <- data.frame(day=1:36, correlations = corrn2)

lines(res_topo2n, col='orange')


#Grupo 3 de correlacion humedad y NDVI

dat_topo3n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrn3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3n[,36+i], y=dat_topo3n[,i]))
  corrn3[i] <- cor(df$x, df$y)
}
res_topo3n  <- data.frame(day=1:36, correlations = corrn3)
lines(res_topo3n, col='blue')



#Grupo 4 de correlacion humedad y NDVI

dat_topo4n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4, ]
corrn4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4n[36+i], y=dat_topo4n[,i]))
  corrn4[i] <- cor(df$x, df$y)
}
res_topo4n <- data.frame(day=1:36, correlations = corrn4)

lines(res_topo4n, col='bisque')


# DE ESTE CODIGO DESDE LA LINEA 7 A LA 67 SE GENERA UN GRAFICO, 
#EN EL CASO DE LA LINEA 28, 41, 53, 67 ES DE CAMBIAR LA FORMA Y COLORES DE LAS LINEAS
#COLOCAR LEYANDA 
#COLOCAR LOS NOMBRE DE LOS EJES 
