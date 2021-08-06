
library(raster)
library(mapview)
library(rasterVis)


#Correlacion de SSM y FAPAR revisar el orden de X (ssm) ; Y(ndvi)
dat <- readRDS("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_ET_Temp_topo.rds")
corrn <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corrn[i] <- cor(df$x, df$y)
}
resn <- data.frame(Días=1:36, Correlación = corrn)
plot(resn, col='black', ylim=c(-0.5, 0.5), main="Correlación SSM y FAPAR")
lines(resn)
abline(h=0)
#mapview(dat)

#Grupo 1 de correlacion humedad y FAPAR
dat_topo1n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1, ]
corrn1 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo1n[,36+i], y=dat_topo1n[,i]))
  corrn1[i] <- cor(df$x, df$y)
}
res_topo1n  <- data.frame(Días=1:36, Correlación = corrn1)

lines(res_topo1n, col='aquamarine4')


#Grupo 2 de correlacion humedad y FAPAR

dat_topo2n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrn2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2n[,36+i], y=dat_topo2n[,i]))
  corrn2[i] <- cor(df$x, df$y)
}
res_topo2n  <- data.frame(day=1:36, correlations = corrn2)

lines(res_topo2n, col='orange')


#Grupo 3 de correlacion humedad y FAPAR

dat_topo3n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrn3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3n[,36+i], y=dat_topo3n[,i]))
  corrn3[i] <- cor(df$x, df$y)
}
res_topo3n  <- data.frame(day=1:36, correlations = corrn3)
lines(res_topo3n, col='blue')



#Grupo 4 de correlacion humedad y FAPAR

dat_topo4n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4, ]
corrn4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4n[36+i], y=dat_topo4n[,i]))
  corrn4[i] <- cor(df$x, df$y)
}
res_topo4n <- data.frame(day=1:36, correlations = corrn4)

lines(res_topo4n, col='bisque')


# FORMAS PARA RESENTAR LA LEYENDA
legend("topright",         # Posición
       legend = c("Grupo Topografico 1", "Grupo Topografico 2", "Grupo Topografico 3", "Grupo Topografico 4"), # Textos de la leyenda
       col = c('aquamarine4', 'orange', 'blue','bisque'),          # Colores de las líneas
       lwd = 2)


plot(dat@data[,37], y=dat@data[,1])
summary(dat@data[,c(1,37)])
cor(na.omit(dat@data[,c(1,37)]))
dat$meanSM <-  colMeans(dat@data[37:72], na.rm = TRUE)
dat$meanNDVI <- colMeans(dat@data[1:36], na.rm = TRUE)

# PRECIPITACION Y HUMEDAD
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

#REALIZAR MENSUAL, PERO HAY DUDAS
dat@data$media3dias <- rowMeans(dat@data[1:3])



# TEMPERATURA Y HUMEDAD Ver como hacer mensual ??????

#Correlacion de Temperatura con humedad revisar el orden de X (Temp) ; Y (ssm)
dat@data$media3dias <- rowMeans(dat@data[1:3])
