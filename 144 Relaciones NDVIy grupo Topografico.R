library(raster)
library(mapview)
library(rgdal)

km_Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)
mapview(km_Topografic)

Grupo1 <- km_Topografic
Grupo1[Grupo1 != 1] <- NA
plot(Grupo1)
#writeRaster(Grupo1, file="Grupo1Topografico.tif")

Grupo2 <- km_Topografic
Grupo2[Grupo2 != 2] <- NA
plot(Grupo2)
#writeRaster(Grupo2, file="Grupo2Topografico.tif")

Grupo3 <- km_Topografic
Grupo3[Grupo3 != 3] <- NA
plot(Grupo3)
#writeRaster(Grupo3, file="Grupo3Topografico.tif")

Grupo4 <- km_Topografic
Grupo4[Grupo4 != 4] <- NA
plot(Grupo4)
#writeRaster(Grupo4, file="Grupo4Topografico.tif")

#CAMBIAR A NDVI


# Dia1_enero2020ndvi

SSM12_21dic2019 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/1_Dia1_enero2020ndvi_maskCobe.tif")
plot(SSM12_21dic2019)


MascaraSSM12_21dic2019topo1 <- mask(SSM12_21dic2019, Grupo1)
plot(MascaraSSM12_21dic2019topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
df12dic1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_enero2020ndvi")
write.csv(df12dic1, file ='1_TablaEstadisticaDia1_enero2020ndviGrupo1.csv')

MascaraSSM12_21dic2019topo2 <- mask(SSM12_21dic2019, Grupo2)
plot(MascaraSSM12_21dic2019topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
df12dic2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_enero2020ndvi")
write.csv(df12dic2, file ='2_TablaEstadisticaDia1_enero2020ndviGrupo2.csv')

MascaraSSM12_21dic2019topo3 <- mask(SSM12_21dic2019, Grupo3)
plot(MascaraSSM12_21dic2019topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
df12dic3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_enero2020ndvi")
write.csv(df12dic3, file ='3_TablaEstadisticaDia1_enero2020ndviGrupo3.csv')

MascaraSSM12_21dic2019topo4 <- mask(SSM12_21dic2019, Grupo4)
plot(MascaraSSM12_21dic2019topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
df12dic4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_enero2020ndvi")
write.csv(df12dic4, file ='4_TablaEstadisticaDia1_enero2020ndviGrupo4.csv')

# Dia 22 dic 2019 al 1 de enero 2020 (11 dias)

SSM22dic2019_1enero2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/2_Dia11_enero2020ndvi_maskCobe.tif")
plot(SSM22dic2019_1enero2020)


MascaraSSM22dic2019_1enero2020topo1 <- mask(SSM22dic2019_1enero2020, Grupo1)
plot(MascaraSSM22dic2019_1enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
df22dic1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_enero2020ndvi")
write.csv(df22dic1, file ='5_TablaEstadisticaDia11_enero2020ndviGrupo1.csv')

MascaraSSM22dic2019_1enero2020topo2 <- mask(SSM22dic2019_1enero2020, Grupo2)
plot(MascaraSSM22dic2019_1enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
df22dic2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_enero2020ndvi")
write.csv(df22dic2, file ='6_TablaEstadisticaDia11_enero2020ndviGrupo2.csv')

MascaraSSM22dic2019_1enero2020topo3 <- mask(SSM22dic2019_1enero2020, Grupo3)
plot(MascaraSSM22dic2019_1enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
df22dic3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_enero2020ndvi")
write.csv(df22dic3, file ='7_TablaEstadisticaDia11_enero2020ndviGrupo3.csv')

MascaraSSM22dic2019_1enero2020topo4 <- mask(SSM22dic2019_1enero2020, Grupo4)
plot(MascaraSSM22dic2019_1enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
df22dic4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_enero2020ndvi")
write.csv(df22dic4, file ='8_TablaEstadisticaDia11_enero2020ndviGrupo4.csv')

# Dia 2 al 11 de enero 2020

SSM2_11enero2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/3_Dia21_enero2020ndvi_maskCobe.tif")


MascaraSSM2_11enero2020topo1 <- mask(SSM2_11enero2020, Grupo1)
plot(MascaraSSM2_11enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
df2enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_enero2020ndvi")
write.csv(df2enero1, file ='9_TablaEstadisticaDia21_enero2020ndviGrupo1.csv')

MascaraSSM2_11enero2020topo2 <- mask(SSM2_11enero2020, Grupo2)
plot(MascaraSSM2_11enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
df2enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_enero2020ndvi")
write.csv(df2enero2, file ='10_TablaEstadisticaDia21_enero2020ndviGrupo2.csv')

MascaraSSM2_11enero2020topo3 <- mask(SSM2_11enero2020, Grupo3)
plot(MascaraSSM2_11enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
df2enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_enero2020ndvi")
write.csv(df2enero3, file ='11_TablaEstadisticaDia21_enero2020ndviGrupo3.csv')

MascaraSSM2_11enero2020topo4 <- mask(SSM2_11enero2020, Grupo4)
plot(MascaraSSM2_11enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
df2enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_enero2020ndvi")
write.csv(df2enero4, file ='12_TablaEstadisticaDia21_enero2020ndviGrupo4.csv')


# Dia 12 al 21 de enero 2020

SSM12_21enero2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/4_Dia1_febrero2020ndvi_maskCobe.tif")


MascaraSSM12_21enero2020topo1 <- mask(SSM12_21enero2020, Grupo1)
plot(MascaraSSM12_21enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
df12enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_febrero2020ndvi")
write.csv(df12enero1, file ='13_TablaEstadisticaDia1_febrero2020ndviGrupo1.csv')

MascaraSSM12_21enero2020topo2 <- mask(SSM12_21enero2020, Grupo2)
plot(MascaraSSM12_21enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
df12enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_febrero2020ndvi")
write.csv(df12enero2, file ='14_TablaEstadisticaDia1_febrero2020ndviGrupo2.csv')

MascaraSSM12_21enero2020topo3 <- mask(SSM12_21enero2020, Grupo3)
plot(MascaraSSM2_11enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
df12enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_febrero2020ndvi")
write.csv(df12enero3, file ='15_TablaEstadisticaDia1_febrero2020ndviGrupo3.csv')

MascaraSSM12_21enero2020topo4 <- mask(SSM12_21enero2020, Grupo4)
plot(MascaraSSM12_21enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
df12enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_febrero2020ndvi")
write.csv(df12enero4, file ='16_TablaEstadisticaDia1_febrero2020ndviGrupo4.csv')


# Dia 22 de enero al 1 Febrero 2020 (11 dias)

SSM22enero_1febr2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/5_Dia11_febrero2020ndvi_maskCobe.tif")


MascaraSSSM22enero_1febr2020topo1 <- mask(SSM22enero_1febr2020, Grupo1)
plot(MascaraSSSM22enero_1febr2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
df22enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_febrero2020ndvi")
write.csv(df22enero1, file ='17_TablaEstadisticaDia11_febrero2020ndviGrupo1.csv')

MascaraSSM22enero_1febr2020topo2 <- mask(SSM22enero_1febr2020, Grupo2)
plot(MascaraSSM22enero_1febr2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
df22enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_febrero2020ndvi")
write.csv(df22enero2, file ='18_TablaEstadisticaDia11_febrero2020ndviGrupo2.csv')

MascaraSSM22enero_1febr2020topo3 <- mask(SSM22enero_1febr2020, Grupo3)
plot(MascaraSSM22enero_1febr2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
df22enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_febrero2020ndvi")
write.csv(df22enero3, file ='19_TablaEstadisticaDia11_febrero2020ndviGrupo3.csv')

MascaraSSM22enero_1febr2020topo4 <- mask(SSM22enero_1febr2020, Grupo4)
plot(MascaraSSM22enero_1febr2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
df22enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_febrero2020ndvi")
write.csv(df22enero4, file ='20_TablaEstadisticaDia11_febrero2020ndviGrupo4.csv')


# Dia 2 al 11 Febrero 2020 (11 dias)

SSM2_11febr2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/6_Dia21_febrero2020ndvi_maskCobe.tif")


MascaraSSM2_11febr2020topo1 <- mask(SSM2_11febr2020, Grupo1)
plot(MascaraSSM2_11febr2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
df2Febre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_febrero2020ndvi")
write.csv(df2Febre1, file ='21_TablaEstadisticaDia21_febrero2020ndviGrupo1.csv')

MascaraSSM2_11febr2020topo2 <- mask(SSM2_11febr2020, Grupo2)
plot(MascaraSSM2_11febr2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
df2Febre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_febrero2020ndvi")
write.csv(df2Febre2, file ='22_TablaEstadisticaDia21_febrero2020ndviGrupo2.csv')

MascaraSSM2_11febr2020topo3 <- mask(SSM2_11febr2020, Grupo3)
plot(MascaraSSM2_11febr2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
df2Febre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_febrero2020ndvi")
write.csv(df2Febre3, file ='23_TablaEstadisticaDia21_febrero2020ndviGrupo3.csv')

MascaraSSM2_11febr2020topo4 <- mask(SSM2_11febr2020, Grupo4)
plot(MascaraSSM2_11febr2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
df2Febre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_febrero2020ndvi")
write.csv(df2Febre4, file ='24_TablaEstadisticaDia21_febrero2020ndviGrupo4.csv')

# Dia 12 al 21  Febrero 2020 (11 dias)

SSM12_21febr2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/7_Dia1_marzo2020ndvi_maskCobe.tif")


MascaraSSM12_21febr2020topo1 <- mask(SSM12_21febr2020, Grupo1)
plot(MascaraSSM12_21febr2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21febr2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21febr2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21febr2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21febr2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21febr2020topo1))[,1])
df12Febre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_marzo2020ndvi")
write.csv(df12Febre1, file ='25_TablaEstadisticaDia1_marzo2020ndviGrupo1.csv')

MascaraSSM12_21febr2020topo2 <- mask(SSM12_21febr2020, Grupo2)
plot(MascaraSSM12_21febr2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21febr2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21febr2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21febr2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21febr2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21febr2020topo2))[,1])
df12Febre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_marzo2020ndvi")
write.csv(df12Febre2, file ='26_TablaEstadisticaDia1_marzo2020ndviGrupo2.csv')

MascaraSSM12_21febr2020topo3 <- mask(SSM12_21febr2020, Grupo3)
plot(MascaraSSM12_21febr2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21febr2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21febr2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21febr2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21febr2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21febr2020topo3))[,1])
df12Febre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_marzo2020ndvi")
write.csv(df12Febre3, file ='27_TablaEstadisticaDia1_marzo2020ndviGrupo3.csv')

MascaraSSM12_21febr2020topo4 <- mask(SSM12_21febr2020, Grupo4)
plot(MascaraSSM12_21febr2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21febr2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21febr2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21febr2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21febr2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21febr2020topo4))[,1])
df12Febre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_marzo2020ndvi")
write.csv(df12Febre4, file ='28_TablaEstadisticaDia1_marzo2020ndviGrupo4.csv')


# Dia 22  Febrero 2020 al 1 de Marzo

SSM22febr_1Marzo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/8_Dia11_marzo2020ndvi_maskCobe.tif")


MascaraSSM22febr_1Marzo2020topo1 <- mask(SSM22febr_1Marzo2020, Grupo1)
plot(MascaraSSM22febr_1Marzo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo1))[,1])
df22Febre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_marzo2020ndvi")
write.csv(df22Febre1, file ='29_TablaEstadisticaDia11_marzo2020ndviGrupo1.csv')

MascaraSSM22febr_1Marzo2020topo2 <- mask(SSM22febr_1Marzo2020, Grupo2)
plot(MascaraSSM22febr_1Marzo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo2))[,1])
df22Febre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_marzo2020ndvi")
write.csv(df22Febre2, file ='30_TablaEstadisticaDia11_marzo2020ndviGrupo2.csv')

MascaraSSM22febr_1Marzo2020topo3 <- mask(SSM22febr_1Marzo2020, Grupo3)
plot(MascaraSSM22febr_1Marzo2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo3))[,1])
df22Febre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_marzo2020ndvi")
write.csv(df22Febre3, file ='31_TablaEstadisticaDia11_marzo2020ndviGrupo3.csv')

MascaraSSM22febr_1Marzo2020topo4 <- mask(SSM22febr_1Marzo2020, Grupo4)
plot(MascaraSSM22febr_1Marzo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22febr_1Marzo2020topo4))[,1])
df22Febre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_marzo2020ndvi")
write.csv(df22Febre4, file ='32_TablaEstadisticaDia11_marzo2020ndviGrupo4.csv')


# Dia 2 al 11 de Marzo

SSM2_11Marzo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/9_Dia21_marzo2020ndvi_maskCobe.tif")


MascaraSSM2_11Marzo2020topo1 <- mask(SSM2_11Marzo2020, Grupo1)
plot(MascaraSSM2_11Marzo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo1))[,1])
df2Marzo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_marzo2020ndvi")
write.csv(df2Marzo1, file ='33_TablaEstadisticaDia21_marzo2020ndviGrupo1.csv')

MascaraSSM2_11Marzo2020topo2 <- mask(SSM2_11Marzo2020, Grupo2)
plot(MascaraSSM2_11Marzo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo2))[,1])
df2Marzo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_marzo2020ndvi")
write.csv(df2Marzo2, file ='34_TablaEstadisticaDia21_marzo2020ndviGrupo2.csv')

MascaraSSM2_11Marzo2020topo3 <- mask(SSM2_11Marzo2020, Grupo3)
plot(MascaraSSM2_11Marzo2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo3))[,1])
df2Marzo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_marzo2020ndvi")
write.csv(df2Marzo3, file ='35_TablaEstadisticaDia21_marzo2020ndviGrupo3.csv')

MascaraSSM2_11Marzo2020topo4 <- mask(SSM2_11Marzo2020, Grupo4)
plot(MascaraSSM2_11Marzo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Marzo2020topo4))[,1])
df2Marzo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_marzo2020ndvi")
write.csv(df2Marzo4, file ='36_TablaEstadisticaDia21_marzo2020ndviGrupo4.csv')

# Dia 12 al 21 de Marzo

SSM12_21Marzo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/10_Dia1_abril2020ndvi_maskCobe.tif")


MascaraSSM12_21Marzo2020topo1 <- mask(SSM12_21Marzo2020, Grupo1)
plot(MascaraSSM12_21Marzo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo1))[,1])
df12Marzo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_abril2020ndvi")
write.csv(df12Marzo1, file ='37_TablaEstadisticaDia1_abril2020ndviGrupo1.csv')

MascaraSSM12_21Marzo2020topo2 <- mask(SSM12_21Marzo2020, Grupo2)
plot(MascaraSSM12_21Marzo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo2))[,1])
df12Marzo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_abril2020ndvi")
write.csv(df12Marzo2, file ='38_TablaEstadisticaDia1_abril2020ndviGrupo2.csv')

MascaraSSM12_21Marzo2020topo3 <- mask(SSM12_21Marzo2020, Grupo3)
plot(MascaraSSM12_21Marzo2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo3))[,1])
df12Marzo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_abril2020ndvi")
write.csv(df12Marzo3, file ='39_TablaEstadisticaDia1_abril2020ndviGrupo3.csv')

MascaraSSM12_21Marzo2020topo4 <- mask(SSM12_21Marzo2020, Grupo4)
plot(MascaraSSM12_21Marzo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Marzo2020topo4))[,1])
df12Marzo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_abril2020ndvi")
write.csv(df12Marzo4, file ='40_TablaEstadisticaDia1_abril2020ndviGrupo4.csv')



# Dia 22 de Marzo al 1 de abril

SSM22Marzo_1abril2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/11_Dia11_abril2020ndvi_maskCobe.tif")


MascaraSSM22Marzo_1abril2020topo1 <- mask(SSM22Marzo_1abril2020, Grupo1)
plot(MascaraSSM22Marzo_1abril2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo1))[,1])
df22Marzo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_abril2020ndvi")
write.csv(df22Marzo1, file ='41_TablaEstadisticaDia11_abril2020ndviGrupo1.csv')

MascaraSSM22Marzo_1abril2020topo2 <- mask(SSM22Marzo_1abril2020, Grupo2)
plot(MascaraSSM2_11Marzo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo2))[,1])
df22Marzo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_abril2020ndvi")
write.csv(df22Marzo2, file ='42_TablaEstadisticaDia11_abril2020ndviGrupo2.csv')

MascaraSSM22Marzo_1abril2020topo3 <- mask(SSM22Marzo_1abril2020, Grupo3)
plot(MascaraSSM22Marzo_1abril2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo3))[,1])
df22Marzo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_abril2020ndvi")
write.csv(df22Marzo3, file ='43_TablaEstadisticaDia11_abril2020ndviGrupo3.csv')

MascaraSSM22Marzo_1abril2020topo4 <- mask(SSM22Marzo_1abril2020, Grupo4)
plot(MascaraSSM22Marzo_1abril2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Marzo_1abril2020topo4))[,1])
df22Marzo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_abril2020ndvi")
write.csv(df22Marzo4, file ='44_TablaEstadisticaDia11_abril2020ndviGrupo4.csv')


# Dia 2 al 11 de abril

SSM2_11abril2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/12_Dia21_abril2020ndvi_maskCobe.tif")


MascaraSSM2_11abril2020topo1 <- mask(SSM2_11abril2020, Grupo1)
plot(MascaraSSM2_11abril2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11abril2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11abril2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11abril2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11abril2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11abril2020topo1))[,1])
df2abril1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_abril2020ndvi")
write.csv(df2abril1, file ='45_TablaEstadisticaDia21_abril2020ndviGrupo1.csv')

MascaraSSM2_11abril2020topo2 <- mask(SSM2_11abril2020, Grupo2)
plot(MascaraSSM2_11abril2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11abril2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11abril2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11abril2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11abril2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11abril2020topo2))[,1])
df2abril2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_abril2020ndvi")
write.csv(df2abril2, file ='46_TablaEstadisticaDia21_abril2020ndviGrupo2.csv')

MascaraSSM2_11abril2020topo3 <- mask(SSM2_11abril2020, Grupo3)
plot(MascaraSSM2_11abril2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11abril2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11abril2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11abril2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11abril2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11abril2020topo3))[,1])
df2abril3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_abril2020ndvi")
write.csv(df2abril3, file ='47_TablaEstadisticaDia21_abril2020ndviGrupo3.csv')

MascaraSSM2_11abril2020topo4 <- mask(SSM2_11abril2020, Grupo4)
plot(MascaraSSM2_11abril2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11abril2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11abril2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11abril2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11abril2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11abril2020topo4))[,1])
df2abril4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_abril2020ndvi")
write.csv(df2abril4, file ='48_TablaEstadisticaDia21_abril2020ndviGrupo4.csv')



# Dia 12 al 21 de abril

SSM12_21abril2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/13_Dia1_Mayo2020ndvi_maskCobe.tif")

MascaraSSM12_21abril2020topo1 <- mask(SSM12_21abril2020, Grupo1)
plot(MascaraSSM12_21abril2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21abril2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21abril2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21abril2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21abril2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21abril2020topo1))[,1])
df12abril1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_Mayo2020ndvi")
write.csv(df12abril1, file ='49_TablaEstadisticaDia1_Mayo2020ndviGrupo1.csv')

MascaraSSM12_21abril2020topo2 <- mask(SSM12_21abril2020, Grupo2)
plot(MascaraSSM12_21abril2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21abril2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21abril2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21abril2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21abril2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21abril2020topo2))[,1])
df12abril2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_Mayo2020ndvi")
write.csv(df12abril2, file ='50_TablaEstadisticaDia1_Mayo2020ndviGrupo2.csv')

MascaraSSM12_21abril2020topo3 <- mask(SSM12_21abril2020, Grupo3)
plot(MascaraSSM12_21abril2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21abril2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21abril2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21abril2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21abril2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21abril2020topo3))[,1])
df12abril3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_Mayo2020ndvi")
write.csv(df12abril3, file ='51_TablaEstadisticaDia1_Mayo2020ndviGrupo3.csv')

MascaraSSM12_21abril20200topo4 <- mask(SSM12_21abril2020, Grupo4)
plot(MascaraSSM12_21abril20200topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21abril20200topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21abril20200topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21abril20200topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21abril20200topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21abril20200topo4))[,1])
df12abril4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_Mayo2020ndvi")
write.csv(df12abril4, file ='52_TablaEstadisticaDia1_Mayo2020ndviGrupo4.csv')


# Dia 22 de abril al 1 Mayo

SSM22abril_1mayo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/14_Dia11_Mayo2020ndvi_maskCobe.tif")


MascaraSSM22abril_1mayo2020topo1 <- mask(SSM22abril_1mayo2020, Grupo1)
plot(MascaraSSM22abril_1mayo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo1))[,1])
df22abril1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_Mayo2020ndvi")
write.csv(df22abril1, file ='53_TablaEstadisticaDia11_Mayo2020ndviGrupo1.csv')

MascaraSSM22abril_1mayo2020topo2 <- mask(SSM22abril_1mayo2020, Grupo2)
plot(MascaraSSM22abril_1mayo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo2))[,1])
df22abril2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_Mayo2020ndvi")
write.csv(df22abril2, file ='54_TablaEstadisticaDia11_Mayo2020ndviGrupo2.csv')

MascaraSSM22abril_1mayo2020topo3 <- mask(SSM22abril_1mayo2020, Grupo3)
plot(MascaraSSM22abril_1mayo2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo3))[,1])
df22abril3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_Mayo2020ndvi")
write.csv(df22abril3, file ='55_TablaEstadisticaDia11_Mayo2020ndviGrupo3.csv')

MascaraSSM22abril_1mayo2020topo4 <- mask(SSM22abril_1mayo2020, Grupo4)
plot(MascaraSSM22abril_1mayo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22abril_1mayo2020topo4))[,1])
df22abril4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_Mayo2020ndvi")
write.csv(df22abril4, file ='56_TablaEstadisticaDia11_Mayo2020ndviGrupo4.csv')



# Dia 2 al 11 Mayo

SSM2_11mayo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/15_Dia21_Mayo2020ndvi_maskCobe.tif")


MascaraSSM2_11mayo2020topo1 <- mask(SSM2_11mayo2020, Grupo1)
plot(MascaraSSM2_11mayo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo1))[,1])
df2mayo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_Mayo2020ndvi")
write.csv(df2mayo1, file ='57_TablaEstadisticaDia21_Mayo2020ndviGrupo1.csv')

MascaraSSM2_11mayo2020topo2 <- mask(SSM2_11mayo2020, Grupo2)
plot(MascaraSSM2_11mayo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo2))[,1])
df2mayo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_Mayo2020ndvi")
write.csv(df2mayo2, file ='58_TablaEstadisticaDia21_Mayo2020ndviGrupo2.csv')

MascaraSSM2_11mayo2020topo3 <- mask(SSM2_11mayo2020, Grupo3)
plot(MascaraSSM2_11mayo2020topo3 )
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo3 ))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo3 ))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo3 ))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo3 ))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo3 ))[,1])
df2mayo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_Mayo2020ndvi")
write.csv(df2mayo3, file ='59_TablaEstadisticaDia21_Mayo2020ndviGrupo3.csv')

MascaraSSM2_11mayo2020topo4 <- mask(SSM2_11mayo2020, Grupo4)
plot(MascaraSSM2_11mayo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11mayo2020topo4))[,1])
df2mayo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_Mayo2020ndvi")
write.csv(df2mayo4, file ='60_TablaEstadisticaDia21_Mayo2020ndviGrupo4.csv')


# Dia 12 al 21 Mayo

SSM12_21mayo2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/16_Dia1_junio2020ndvi_maskCobe.tif")


MascaraSSM12_21mayo2020topo1 <- mask(SSM12_21mayo2020, Grupo1)
plot(MascaraSSM12_21mayo2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo1))[,1])
df12mayo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_junio2020ndvi")
write.csv(df12mayo1, file ='61_TablaEstadisticaDia1_junio2020ndviGrupo1.csv')

MascaraSSM12_21mayo2020topo2 <- mask(SSM12_21mayo2020, Grupo2)
plot(MascaraSSM12_21mayo2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo2))[,1])
df12mayo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_junio2020ndvi")
write.csv(df12mayo2, file ='62_TablaEstadisticaDia1_junio2020ndviGrupo2.csv')

MascaraSSM12_21mayo2020topo3 <- mask(SSM12_21mayo2020, Grupo3)
plot(MascaraSSM12_21mayo2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo3))[,1])
df12mayo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_junio2020ndvi")
write.csv(df12mayo3, file ='63_TablaEstadisticaDia1_junio2020ndviGrupo3.csv')

MascaraSSM12_21mayo2020topo4 <- mask(SSM12_21mayo2020, Grupo4)
plot(MascaraSSM12_21mayo2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21mayo2020topo4))[,1])
df12mayo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_junio2020ndvi")
write.csv(df12mayo4, file ='64_TablaEstadisticaDia1_junio2020ndviGrupo4.csv')


# Dia 22 Mayo al 1 Junio

SSM22mayo_1Jumio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/17_Dia11_junio2020ndvi_maskCobe.tif")


MascaraSSM22mayo_1Jumio2020topo1 <- mask(SSM22mayo_1Jumio2020, Grupo1)
plot(MascaraSSM22mayo_1Jumio2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo1))[,1])
df22mayo1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_junio2020ndvi")
write.csv(df22mayo1, file ='65_TablaEstadisticaDia11_junio2020ndviGrupo1.csv')

MascaraSSSM22mayo_1Jumio2020topo2 <- mask(SSM22mayo_1Jumio2020, Grupo2)
plot(MascaraSSSM22mayo_1Jumio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSSM22mayo_1Jumio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSSM22mayo_1Jumio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSSM22mayo_1Jumio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSSM22mayo_1Jumio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSSM22mayo_1Jumio2020topo2))[,1])
df22mayo2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_junio2020ndvi")
write.csv(df22mayo2, file ='66_TablaEstadisticaDia11_junio2020ndviGrupo2.csv')

MascaraSSM22mayo_1Jumio2020topo3 <- mask(SSM22mayo_1Jumio2020, Grupo3)
plot(MascaraSSM22mayo_1Jumio2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo3))[,1])
df22mayo3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_junio2020ndvi")
write.csv(df22mayo3, file ='67_TablaEstadisticaDia11_junio2020ndviGrupo3.csv')

MascaraSSM22mayo_1Jumio2020topo4 <- mask(SSM22mayo_1Jumio2020, Grupo4)
plot(MascaraSSM22mayo_1Jumio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22mayo_1Jumio2020topo4))[,1])
df22mayo4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_junio2020ndvi")
write.csv(df22mayo4, file ='68_TablaEstadisticaDia11_junio2020ndviGrupo4.csv')



# Dia 2 al 11 Junio

SSM2_11Jumio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/18_Dia21_junio2020ndvi_maskCobe.tif")


MascaraSSM2_11Jumio2020topo1 <- mask(SSM2_11Jumio2020, Grupo1)
plot(MascaraSSM2_11Jumio2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo1))[,1])
df2junio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_junio2020ndvi")
write.csv(df2junio1, file ='69_TablaEstadisticaDia21_junio2020ndviGrupo1.csv')

MascaraSSSMSSM2_11Jumio2020topo2 <- mask(SSM2_11Jumio2020, Grupo2)
plot(MascaraSSSMSSM2_11Jumio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSSMSSM2_11Jumio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSSMSSM2_11Jumio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSSMSSM2_11Jumio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSSMSSM2_11Jumio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSSMSSM2_11Jumio2020topo2))[,1])
df2junio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_junio2020ndvi")
write.csv(df2junio2, file ='70_TablaEstadisticaDia21_junio2020ndviGrupo2.csv')

MascaraSSM2_11Jumio2020topo3 <- mask(SSM2_11Jumio2020, Grupo3)
plot(MascaraSSM2_11Jumio2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo3))[,1])
df2junio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_junio2020ndvi")
write.csv(df2junio3, file ='71_TablaEstadisticaDia21_junio2020ndviGrupo3.csv')

MascaraSSM2_11Jumio2020topo4 <- mask(SSM2_11Jumio2020, Grupo4)
plot(MascaraSSM2_11Jumio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11Jumio2020topo4))[,1])
df2junio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_junio2020ndvi")
write.csv(df2junio4, file ='72_TablaEstadisticaDia21_junio2020ndviGrupo4.csv')



# Dia 12 al 21 Junio

SSM12_21Jumio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/19_Dia1_julio2020ndvi_maskCobe.tif")


MascaraSSM12_21Jumio2020topo1 <- mask(SSM12_21Jumio2020, Grupo1)
plot(MascaraSSM12_21Jumio2020topo1 )
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo1 ))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo1 ))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo1 ))[,1])
df12junio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_julio2020ndvi")
write.csv(df12junio1, file ='73_TablaEstadisticaDia1_julio2020ndviGrupo1.csv')

MascaraSSM12_21Jumio2020topo2 <- mask(SSM12_21Jumio2020, Grupo2)
plot(MascaraSSM12_21Jumio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo2))[,1])
df12junio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_julio2020ndvi")
write.csv(df12junio2, file ='74_TablaEstadisticaDia1_julio2020ndviGrupo2.csv')

MascaraSSM12_21Jumio2020topo3 <- mask(SSM12_21Jumio2020, Grupo3)
plot(MascaraSSM12_21Jumio2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo3))[,1])
df12junio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_julio2020ndvi")
write.csv(df12junio3, file ='75_TablaEstadisticaDia1_julio2020ndviGrupo3.csv')

MascaraSSM12_21Jumio2020topo4 <- mask(SSM12_21Jumio2020, Grupo4)
plot(MascaraSSM12_21Jumio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21Jumio2020topo4))[,1])
df12junio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_julio2020ndvi")
write.csv(df12junio4, file ='76_TablaEstadisticaDia1_julio2020ndviGrupo4.csv')




# Dia 22 Junio al 1 de Julio

SSM22Jumio_2julio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/20_Dia11_julio2020ndvi_maskCobe.tif")


MascaraSSM22Jumio_2julio2020opo1 <- mask(SSM22Jumio_2julio2020, Grupo1)
plot(MascaraSSM22Jumio_2julio2020opo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020opo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020opo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020opo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020opo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020opo1))[,1])
df22junio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_julio2020ndvi")
write.csv(df22junio1, file ='77_TablaEstadisticaDia11_julio2020ndviGrupo1.csv')

MascaraSSM22Jumio_2julio2020topo2 <- mask(SSM22Jumio_2julio2020, Grupo2)
plot(MascaraSSM12_21Jumio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo2))[,1])
df22junio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_julio2020ndvi")
write.csv(df22junio2, file ='78_TablaEstadisticaDia11_julio2020ndviGrupo2.csv')

MascaraSSM22Jumio_2julio2020topo3 <- mask(SSM22Jumio_2julio2020, Grupo3)
plot(MascaraSSM22Jumio_2julio2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo3))[,1])
df22junio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_julio2020ndvi")
write.csv(df22junio3, file ='79_TablaEstadisticaDia11_julio2020ndviGrupo3.csv')

MascaraSSM22Jumio_2julio2020topo4 <- mask(SSM22Jumio_2julio2020, Grupo4)
plot(MascaraSSM22Jumio_2julio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22Jumio_2julio2020topo4))[,1])
df22junio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_julio2020ndvi")
write.csv(df22junio4, file ='80_TablaEstadisticaDia11_julio2020ndviGrupo4.csv')


# Dia 2 al 11 de Julio

SSM2_11julio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/21_Dia21_julio2020ndvi_maskCobe.tif")


MascaraSSM2_11julio2020opo1 <- mask(SSM2_11julio2020, Grupo1)
plot(MascaraSSM2_11julio2020opo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11julio2020opo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11julio2020opo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11julio2020opo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11julio2020opo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11julio2020opo1))[,1])
df2Julio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_julio2020ndvi")
write.csv(df2Julio1, file ='81_TablaEstadisticaSSM2_11julio2020Grupo1.csv')

MascaraSSM2_11julio2020topo2 <- mask(SSM2_11julio2020, Grupo2)
plot(MascaraSSM2_11julio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11julio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11julio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11julio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11julio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11julio2020topo2))[,1])
df2Julio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_julio2020ndvi")
write.csv(df2Julio2, file ='82_TablaEstadisticaSSM2_11julio2020Grupo2.csv')

MascaraSSM2_11julio2020topo3 <- mask(SSM2_11julio2020, Grupo3)
plot(MascaraSSM2_11julio2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11julio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11julio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11julio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11julio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11julio2020topo3))[,1])
df2Julio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_julio2020ndvi")
write.csv(df2Julio3, file ='83_TablaEstadisticaSSM2_11julio2020Grupo3.csv')

MascaraSSM2_11julio2020topo4 <- mask(SSM2_11julio2020, Grupo4)
plot(MascaraSSM2_11julio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11julio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11julio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11julio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11julio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11julio2020topo4))[,1])
df2Julio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_julio2020ndvi")
write.csv(df2Julio4, file ='84_TablaEstadisticaSSM2_11julio2020Grupo4.csv')


# Dia 12 al 21 de Julio

SSM12_21julio2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/22_Dia1_agosto2020ndvi_maskCobe.tif")


MascaraSSM12_21julio2020opo1 <- mask(SSM12_21julio2020, Grupo1)
plot(MascaraSSM12_21julio2020opo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21julio2020opo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21julio2020opo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21julio2020opo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21julio2020opo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21julio2020opo1))[,1])
df12Julio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_agosto2020ndvi")
write.csv(df12Julio1, file ='85_TablaEstadisticaSSM12_21julio2020Grupo1.csv')

MascaraSSM12_21julio2020topo2 <- mask(SSM12_21julio2020, Grupo2)
plot(MascaraSSM12_21julio2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21julio2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21julio2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21julio2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21julio2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21julio2020topo2))[,1])
df12Julio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_agosto2020ndvi")
write.csv(df12Julio2, file ='86_TablaEstadisticaSSM12_21julio2020Grupo2.csv')

MascaraSSM12_21julio2020topo3 <- mask(SSM12_21julio2020, Grupo3)
plot(MascaraSSM12_21julio2020topo3 )
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21julio2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21julio2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21julio2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21julio2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21julio2020topo3))[,1])
df12Julio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_agosto2020ndvi")
write.csv(df12Julio3, file ='87_TablaEstadisticaSSM12_21julio2020Grupo3.csv')

MascaraSSM12_21julio2020topo4 <- mask(SSM12_21julio2020, Grupo4)
plot(MascaraSSM12_21julio2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21julio2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21julio2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21julio2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21julio2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21julio2020topo4))[,1])
df12Julio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_agosto2020ndvi")
write.csv(df12Julio4, file ='88_TablaEstadisticaSSM12_21julio2020Grupo4.csv')

# Dia 22 Julio al 1 de Agosto

SSM22julio_1agosto2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/23_Dia11_agosto2020ndvi_maskCobe.tif")


MascaraSSM22julio_1agosto2020opo1 <- mask(SSM22julio_1agosto2020, Grupo1)
plot(MascaraSSM22julio_1agosto2020opo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020opo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020opo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020opo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020opo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020opo1))[,1])
df22Julio1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_agosto2020ndvi")
write.csv(df22Julio1, file ='89_TablaEstadisticaSSM22julio_1agosto2020Grupo1.csv')

MascaraSSM22julio_1agosto2020topo2 <- mask(SSM22julio_1agosto2020, Grupo2)
plot(MascaraSSM22julio_1agosto2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo2))[,1])
df22Julio2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_agosto2020ndvi")
write.csv(df22Julio2, file ='90_TablaEstadisticaSSM22julio_1agosto2020Grupo2.csv')

MascaraSSM22julio_1agosto2020topo3 <- mask(SSM22julio_1agosto2020, Grupo3)
plot(MascaraSSM22julio_1agosto2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo3))[,1])
df22Julio3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_agosto2020ndvi")
write.csv(df22Julio3, file ='91_TablaEstadisticaSSM22julio_1agosto2020Grupo3.csv')

MascaraSSM22julio_1agosto2020topo4 <- mask(SSM22julio_1agosto2020, Grupo4)
plot(MascaraSSM22julio_1agosto2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22julio_1agosto2020topo4))[,1])
df22Julio4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_agosto2020ndvi")
write.csv(df22Julio4, file ='92_TablaEstadisticaSSM22julio_1agosto2020Grupo4.csv')


# Dia 2 al 11 de Agosto

SSM2_11agosto2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/24_Dia21_agosto2020ndvi_maskCobe.tif")


MascaraSSM2_11agosto2020topo1 <- mask(SSM2_11agosto2020, Grupo1)
plot(MascaraSSM2_11agosto2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo1))[,1])
df2agosto1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_agosto2020ndvi")
write.csv(df2agosto1, file ='93_TablaEstadisticaSSM2_11agosto2020Grupo1.csv')

MascaraSSM2_11agosto2020topo2 <- mask(SSM2_11agosto2020, Grupo2)
plot(MascaraSSM2_11agosto2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo2))[,1])
df2agosto2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_agosto2020ndvi")
write.csv(df2agosto2, file ='94_TablaEstadisticaSSM2_11agosto2020Grupo2.csv')

MascaraSSM2_11agosto2020topo3 <- mask(SSM2_11agosto2020, Grupo3)
plot(MascaraSSM2_11agosto2020topo3 )
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo3 ))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo3 ))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo3 ))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo3 ))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo3))[,1])
df2agosto3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_agosto2020ndvi")
write.csv(df2agosto3, file ='95_TablaEstadisticaSSM2_11agosto2020Grupo3.csv')

MascaraSSM2_11agosto2020topo4 <- mask(SSM2_11agosto2020, Grupo4)
plot(MascaraSSM2_11agosto2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11agosto2020topo4))[,1])
df2agosto4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_agosto2020ndvi")
write.csv(df2agosto4, file ='96_TablaEstadisticaSSM2_11agosto2020Grupo4.csv')


# Dia 12 al 21 de Agosto

SSM12_21agosto2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/25_Dia1_septiembre2020ndvi_maskCobe.tif")


MascaraSSM12_21agosto2020topo1 <- mask(SSM12_21agosto2020, Grupo1)
plot(MascaraSSM12_21agosto2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo1))[,1])
df12agosto1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_septiembre2020ndvi")
write.csv(df12agosto1, file ='97_TablaEstadisticaSSM12_21agosto2020Grupo1.csv')

MascaraSSM12_21agosto2020topo2 <- mask(SSM12_21agosto2020, Grupo2)
plot(MascaraSSM12_21agosto2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo2))[,1])
df12agosto2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_septiembre2020ndvi")
write.csv(df12agosto2, file ='98_TablaEstadisticaSSM12_21agosto2020Grupo2.csv')

MascaraSSM12_21agosto2020topo3 <- mask(SSM12_21agosto2020, Grupo3)
plot(MascaraSSM12_21agosto2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo3))[,1])
df12agosto3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_septiembre2020ndvi")
write.csv(df12agosto3, file ='99_TablaEstadisticaSSM12_21agosto2020Grupo3.csv')

MascaraSSM12_21agosto2020topo4 <- mask(SSM12_21agosto2020, Grupo4)
plot(MascaraSSM12_21agosto2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21agosto2020topo4))[,1])
df12agosto4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_septiembre2020ndvi")
write.csv(df12agosto4, file ='100_TablaEstadisticaSSM12_21agosto2020Grupo4.csv')


# Dia 22 de Agosto al 1 septiembre

SSM22agosto_1septi2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/26_Dia11_septiembre2020ndvi_maskCobe.tif")


MascaraSSM22agosto_1septi2020topo1 <- mask(SSM22agosto_1septi2020, Grupo1)
plot(MascaraSSM22agosto_1septi2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo1))[,1])
df22agosto1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_septiembre2020ndvi")
write.csv(df22agosto1, file ='101_TablaEstadisticaSSM22agosto_1septi2020Grupo1.csv')

MascaraSSM22agosto_1septi2020topo2 <- mask(SSM22agosto_1septi2020, Grupo2)
plot(MascaraSSM22agosto_1septi2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo2))[,1])
df22agosto2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_septiembre2020ndvi")
write.csv(df22agosto2, file ='102_TablaEstadisticaSSM22agosto_1septi2020Grupo2.csv')

MascaraSSM22agosto_1septi2020topo3 <- mask(SSM22agosto_1septi2020, Grupo3)
plot(MascaraSSM22agosto_1septi2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo3))[,1])
df22agosto3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_septiembre2020ndvi")
write.csv(df22agosto3, file ='103_TablaEstadisticaSSM22agosto_1septi2020Grupo3.csv')

MascaraSSM22agosto_1septi2020topo4 <- mask(SSM22agosto_1septi2020, Grupo4)
plot(MascaraSSM22agosto_1septi2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22agosto_1septi2020topo4))[,1])
df22agosto4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_septiembre2020ndvi")
write.csv(df22agosto4, file ='104_TablaEstadisticaSSM22agosto_1septi2020Grupo4.csv')



# Dia 2 al 11 septiembre

SSM2_11septi2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/27_Dia21_septiembre2020ndvi_maskCobe.tif")


MascaraSSM2_11septi2020topo1 <- mask(SSM2_11septi2020, Grupo1)
plot(MascaraSSM2_11septi2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
df2septiembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_septiembre2020ndvi")
write.csv(df2septiembre1, file ='105_TablaEstadisticaSSM2_11septi2020Grupo1.csv')

MascaraSSM2_11septi2020topo2 <- mask(SSM2_11septi2020, Grupo2)
plot(MascaraSSM2_11septi2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11septi2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11septi2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11septi2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11septi2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11septi2020topo2))[,1])
df2septiembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_septiembre2020ndvi")
write.csv(df2septiembre2, file ='106_TablaEstadisticaSSM2_11septi2020Grupo2.csv')

MascaraSSM2_11septi2020topo3 <- mask(SSM2_11septi2020, Grupo3)
plot(MascaraSSM2_11septi2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11septi2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11septi2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11septi2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11septi2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11septi2020topo3))[,1])
df2septiembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_septiembre2020ndvi")
write.csv(df2septiembre3, file ='107_TablaEstadisticaSSM2_11septi2020Grupo3.csv')

MascaraSSM2_11septi2020topo4 <- mask(SSM2_11septi2020, Grupo4)
plot(MascaraSSM2_11septi2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11septi2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11septi2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11septi2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11septi2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11septi2020topo4))[,1])
df2septiembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_septiembre2020ndvi")
write.csv(df2septiembre4, file ='108_TablaEstadisticaSSM2_11septi2020Grupo4.csv')

# Dia 12 al 21 septiembre

SSM12_21septi2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/28_Dia1_octubre2020ndvi_maskCobe.tif")


MascaraSSM2_11septi2020topo1 <- mask(SSM12_21septi2020, Grupo1)
plot(MascaraSSM2_11septi2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11septi2020topo1))[,1])
df12septiembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_octubre2020ndvi")
write.csv(df12septiembre1, file ='109_TablaEstadisticaSSM12_21septi2020Grupo1.csv')

MascaraSSM12_21septi2020topo2 <- mask(SSM12_21septi2020, Grupo2)
plot(MascaraSSM12_21septi2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21septi2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21septi2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21septi2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21septi2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21septi2020topo2))[,1])
df12septiembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_octubre2020ndvi")
write.csv(df12septiembre2, file ='110_TablaEstadisticaSSM12_21septi2020Grupo2.csv')

MascaraSSM12_21septi2020topo3 <- mask(SSM12_21septi2020, Grupo3)
plot(MascaraSSM12_21septi2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21septi2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21septi2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21septi2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21septi2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21septi2020topo3))[,1])
df12septiembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_octubre2020ndvi")
write.csv(df12septiembre3, file ='111_TablaEstadisticaSSM12_21septi2020Grupo3.csv')

MascaraSSM12_21septi2020topo4 <- mask(SSM12_21septi2020, Grupo4)
plot(MascaraSSM12_21septi2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
df12septiembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_octubre2020ndvi")
write.csv(df12septiembre4, file ='112_TablaEstadisticaSSM12_21septi2020Grupo4.csv')



# Dia 22 septiembre al 1 de octubre

SSM12septi2020_1octubre <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/29_Dia11_octubre2020ndvi_maskCobe.tif")


MascaraSSM12septi2020_1octubretopo1 <- mask(SSM12septi2020_1octubre, Grupo1)
plot(MascaraSSM12septi2020_1octubretopo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo1))[,1])
df22septiembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_octubre2020ndvi")
write.csv(df2septiembre1, file ='113_TablaEstadisticaSSM22septi2020_1octubreGrupo1.csv')

MascaraSSM12septi2020_1octubretopo2 <- mask(SSM12septi2020_1octubre, Grupo2)
plot(MascaraSSM12septi2020_1octubretopo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo2))[,1])
df22septiembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_octubre2020ndvi")
write.csv(df22septiembre2, file ='114_TablaEstadisticaSSM22septi2020_1octubreGrupo2.csv')

MascaraSSM12septi2020_1octubretopo3 <- mask(SSM12septi2020_1octubre, Grupo3)
plot(MascaraSSM12septi2020_1octubretopo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12septi2020_1octubretopo3))[,1])
df22septiembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_octubre2020ndvi")
write.csv(df22septiembre3, file ='115_TablaEstadisticaSSM22septi2020_1octubreGrupo3.csv')

MascaraSSM12_21septi2020topo4 <- mask(SSM12septi2020_1octubre, Grupo4)
plot(MascaraSSM12_21septi2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21septi2020topo4))[,1])
df22septiembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_octubre2020ndvi")
write.csv(df22septiembre4, file ='116_TablaEstadisticaSSM22septi2020_1octubreGrupo4.csv')


# Dia 2 al 11  de octubre

SSM2_11octubre2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/30_Dia21_octubre2020ndvi_maskCobe.tif")


MascaraSSM2_11octubre2020topo1 <- mask(SSM2_11octubre2020, Grupo1)
plot(MascaraSSM2_11octubre2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo1))[,1])
df2Octubre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_octubre2020ndvi")
write.csv(df2Octubre1, file ='117_TablaEstadisticaSSM2_11octubre2020Grupo1.csv')

MascaraSSM2_11octubre2020topo2 <- mask(SSM2_11octubre2020, Grupo2)
plot(MascaraSSM2_11octubre2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo2))[,1])
df2Octubre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_octubre2020ndvi")
write.csv(df2Octubre2, file ='118_TablaEstadisticaSSM2_11octubre2020Grupo2.csv')

MascaraSSM2_11octubre2020topo3 <- mask(SSM2_11octubre2020, Grupo3)
plot(MascaraSSM2_11octubre2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
df2Octubre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_octubre2020ndvi")
write.csv(df2Octubre3, file ='119_TablaEstadisticaSSM2_11octubre2020Grupo3.csv')

MascaraSSM2_11octubre2020topo4 <- mask(SSM2_11octubre2020, Grupo4)
plot(MascaraSSM2_11octubre2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo4))[,1])
df2Octubre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_octubre2020ndvi")
write.csv(df2Octubre4, file ='120_TablaEstadisticaSSM2_11octubre2020Grupo4.csv')

# Dia 12 al 21 de octubre

SSM12_21octubre2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/31_Dia1_Noviembre2020ndvi_maskCobe.tif")


MascaraSSM12_21octubre2020topo1 <- mask(SSM12_21octubre2020, Grupo1)
plot(MascaraSSM12_21octubre2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo1))[,1])
df12Octubre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_Noviembre2020ndvi")
write.csv(df12Octubre1, file ='121_TablaEstadisticaSSM12_21octubre2020Grupo1.csv')

MascaraSSM12_21octubre2020topo2 <- mask(SSM12_21octubre2020, Grupo2)
plot(MascaraSSM12_21octubre2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo2))[,1])
df12Octubre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_Noviembre2020ndvi")
write.csv(df12Octubre2, file ='122_TablaEstadisticaSSM12_21octubre2020Grupo2.csv')

MascaraSSM2_11octubre2020topo3 <- mask(SSM2_11octubre2020, Grupo3)
plot(MascaraSSM2_11octubre2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11octubre2020topo3))[,1])
df12Octubre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_Noviembre2020ndvi")
write.csv(df12Octubre3, file ='123_TablaEstadisticaSSM2_11octubre2020Grupo3.csv')

MascaraSSM12_21octubre2020topo4 <- mask(SSM12_21octubre2020, Grupo4)
plot(MascaraSSM12_21octubre2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21octubre2020topo4))[,1])
df12Octubre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_Noviembre2020ndvi")
write.csv(df12Octubre4, file ='124_TablaEstadisticaSSM12_21octubre2020Grupo4.csv')


# Dia 22 de octubre 1 de nov 

SSM22octubre_1nov2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/32_Dia11_noviembre2020ndvi_maskCobe.tif")


MascaraSSM22octubre_1nov2020topo1 <- mask(SSM22octubre_1nov2020, Grupo1)
plot(MascaraSSM22octubre_1nov2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo1))[,1])
df22Octubre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_noviembre2020ndvi")
write.csv(df22Octubre1, file ='125_TablaEstadisticaSSM22octubre_1nov2020Grupo1.csv')

MascaraSSM22octubre_1nov2020topo2 <- mask(SSM22octubre_1nov2020, Grupo2)
plot(MascaraSSM22octubre_1nov2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo2))[,1])
df22Octubre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_noviembre2020ndvi")
write.csv(df22Octubre2, file ='126_TablaEstadisticaSSM22octubre_1nov2020Grupo2.csv')

MascaraSSM22octubre_1nov2020topo3 <- mask(SSM22octubre_1nov2020, Grupo3)
plot(MascaraSSM22octubre_1nov2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo3))[,1])
df22Octubre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_noviembre2020ndvi")
write.csv(df22Octubre3, file ='127_TablaEstadisticaSSM22octubre_1nov2020Grupo3.csv')

MascaraSSM22octubre_1nov2020topo4 <- mask(SSM22octubre_1nov2020, Grupo4)
plot(MascaraSSM22octubre_1nov2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22octubre_1nov2020topo4))[,1])
df22Octubre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_noviembre2020ndvi")
write.csv(df22Octubre4, file ='128_TablaEstadisticaSSM22octubre_1nov2020Grupo4.csv')


# Dia 2 al 11 de nov 

SSM2_11nov2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/33_Dia21_noviembre2020ndvi_maskCobe.tif")


MascaraSSM2_11nov2020topo1 <- mask(SSM2_11nov2020, Grupo1)
plot(MascaraSSM2_11nov2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11nov2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11nov2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11nov2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11nov2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11nov2020topo1))[,1])
df2noviembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_noviembre2020ndvi")
write.csv(df2noviembre1, file ='129_TablaEstadisticaSSM2_11nov2020Grupo1.csv')

MascaraSSM2_11nov2020topo2 <- mask(SSM2_11nov2020, Grupo2)
plot(MascaraSSM2_11nov2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11nov2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11nov2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11nov2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11nov2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11nov2020topo2))[,1])
df2noviembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_noviembre2020ndvi")
write.csv(df2noviembre2, file ='130_TablaEstadisticaSSM2_11nov2020Grupo2.csv')

MascaraSSM2_11nov2020topo3 <- mask(SSM2_11nov2020, Grupo3)
plot(MascaraSSM2_11nov2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11nov2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11nov2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11nov2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11nov2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11nov2020topo3))[,1])
df2noviembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_noviembre2020ndvi")
write.csv(df2noviembre3, file ='131_TablaEstadisticaSSM2_11nov2020Grupo3.csv')

MascaraSSM2_11nov2020topo4 <- mask(SSM2_11nov2020, Grupo4)
plot(MascaraSSM2_11nov2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11nov2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11nov2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11nov2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11nov2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11nov2020topo4))[,1])
df2noviembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_noviembre2020ndvi")
write.csv(df2noviembre4, file ='132_TablaEstadisticaSSM2_11nov2020Grupo4.csv')

# Dia 12 al 21 de nov 

SSM12_21nov2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/34_Dia1_diciembre2020ndvi_maskCobe.tif")


MascaraSSM12_21nov2020topo <- mask(SSM12_21nov2020, Grupo1)
plot(MascaraSSM12_21nov2020topo)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
df12noviembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia1_diciembre2020ndvi")
write.csv(df12noviembre1, file ='133_TablaEstadisticaSSM12_21nov2020Grupo1.csv')

MascaraSSM12_21nov2020topo2 <- mask(SSM12_21nov2020, Grupo2)
plot(MascaraSSM12_21nov2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
df12noviembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia1_diciembre2020ndvi")
write.csv(df12noviembre2, file ='134_TablaEstadisticaSSM12_21nov2020Grupo2.csv')

MascaraSSM12_21nov2020topo3 <- mask(SSM12_21nov2020, Grupo3)
plot(MascaraSSM12_21nov2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21nov2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21nov2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21nov2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21nov2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21nov2020topo3))[,1])
df12noviembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia1_diciembre2020ndvi")
write.csv(df12noviembre3, file ='135_TablaEstadisticaSSM12_21nov2020Grupo3.csv')

MascaraSSM12_21nov2020topo4 <- mask(SSM12_21nov2020, Grupo4)
plot(MascaraSSM12_21nov2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21nov2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21nov2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21nov2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21nov2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21nov2020topo4))[,1])
df12noviembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia1_diciembre2020ndvi")
write.csv(df12noviembre4, file ='136_TablaEstadisticaSSM12_21nov2020Grupo4.csv')



# Dia 22 noviembre al 1 diciembre  

SSM22nov_1dici2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/35_Dia11_diciembre2020ndvi_maskCobe.tif")


MascaraSSM22nov_1dici2020topo1 <- mask(SSM22nov_1dici2020, Grupo1)
plot(MascaraSSM22nov_1dici2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21nov2020topo))[,1])
df22noviembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia11_diciembre2020ndvi")
write.csv(df22noviembre1, file ='137_TablaEstadisticaSSM22nov_1dici2020Grupo1.csv')

MascaraSSM22nov_1dici2020topo2 <- mask(SSM22nov_1dici2020, Grupo2)
plot(MascaraSSM22nov_1dici2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21nov2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo2))[,1])
df22noviembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia11_diciembre2020ndvi")
write.csv(df22noviembre2, file ='138_TablaEstadisticaSSM22nov_1dici2020Grupo2.csv')

MascaraSSM22nov_1dici2020topo3 <- mask(SSM22nov_1dici2020, Grupo3)
plot(MascaraSSM22nov_1dici2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo3))[,1])
df22noviembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia11_diciembre2020ndvi")
write.csv(df22noviembre3, file ='139_TablaEstadisticaSSM22nov_1dici2020Grupo3.csv')

MascaraSSM22nov_1dici2020topo4 <- mask(SSM22nov_1dici2020, Grupo4)
plot(MascaraSSM22nov_1dici2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22nov_1dici2020topo4))[,1])
df22noviembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia11_diciembre2020ndvi")
write.csv(df22noviembre4, file ='140_TablaEstadisticaSSM22nov_1dici2020Grupo4.csv')



# Dia 2 al 11 diciembre  

SSM2_11dici2020 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/36_Dia21_diciembre2020ndvi_maskCobe.tif")


MascaraSSM2_11dici2020topo1 <- mask(SSM2_11dici2020, Grupo1)
plot(MascaraSSM2_11dici2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11dici2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11dici2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11dici2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11dici2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11dici2020topo1))[,1])
df2diciembre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "Dia21_diciembre2020ndvi")
write.csv(df2diciembre1, file ='141_TablaEstadisticaSSM2_11dici2020Grupo1.csv')

MascaraSSM2_11dici2020topo2 <- mask(SSM2_11dici2020, Grupo2)
plot(MascaraSSM2_11dici2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11dici2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11dici2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11dici2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11dici2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11dici2020topo2))[,1])
df2diciembre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "Dia21_diciembre2020ndvi")
write.csv(df2diciembre2, file ='142_TablaEstadisticaSSM2_11dici2020Grupo2.csv')

MascaraSSM2_11dici2020topo3 <- mask(SSM2_11dici2020, Grupo3)
plot(MascaraSSM2_11dici2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11dici2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11dici2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11dici2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11dici2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11dici2020topo3))[,1])
df2diciembre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "Dia21_diciembre2020ndvi")
write.csv(df2diciembre3, file ='143_TablaEstadisticaSSM2_11dici2020Grupo3.csv')

MascaraSSM2_11dici2020topo4 <- mask(SSM2_11dici2020, Grupo4)
plot(MascaraSSM2_11dici2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11dici2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11dici2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11dici2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11dici2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11dici2020topo4))[,1])
df2diciembre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "Dia21_diciembre2020ndvi")
write.csv(df2diciembre4, file ='144_TablaEstadisticaSSM2_11dici2020Grupo4.csv')


unionTabla <- rbind(df12dic1, df12dic2, df12dic3, df12dic4, df22dic1,df22dic2, df22dic3, df22dic4, df2enero1, df2enero2, df2enero3, df2enero4, df12enero1, df12enero2, df12enero3, df12enero4, df22enero1, df22enero2, df22enero3, df22enero4, df2Febre1, df2Febre2, df2Febre3, df2Febre4, df12Febre1, df12Febre2, df12Febre3, df12Febre4, df22Febre1, df22Febre2, df22Febre3, df22Febre4, df2Marzo1, df2Marzo2, df2Marzo3, df2Marzo4, df12Marzo1, df12Marzo2, df12Marzo3, df12Marzo4, df22Marzo1, df22Marzo2, df22Marzo3, df22Marzo4, df2abril1, df2abril2, df2abril3, df2abril4, df12abril1, df12abril2, df12abril3, df12abril4, df22abril1, df22abril2, df22abril3, df22abril4, df2mayo1, df2mayo2, df2mayo3, df2mayo4, df12mayo1, df12mayo2, df12mayo3, df12mayo4, df22mayo1, df22mayo2, df22mayo3, df22mayo4, df2junio1, df2junio2, df2junio3, df2junio4, df12junio1, df12junio2, df12junio3, df12junio4, df22junio1, df22junio2, df22junio3, df22junio4, df2Julio1, df2Julio2, df2Julio3, df2Julio4, df12Julio1, df12Julio2, df12Julio3, df12Julio4, df22Julio1, df22Julio2, df22Julio3, df22Julio4, df2agosto1, df2agosto2, df2agosto3, df2agosto4, df12agosto1, df12agosto2, df12agosto3, df12agosto4, df22agosto1, df22agosto2, df22agosto3, df22agosto4, df2septiembre1, df2septiembre2, df2septiembre3, df2septiembre4, df12septiembre1, df12septiembre2, df12septiembre3, df12septiembre4, df22septiembre1, df22septiembre2, df22septiembre3, df22septiembre4, df2Octubre1, df2Octubre2, df2Octubre3, df2Octubre4, df12Octubre1, df12Octubre2, df12Octubre3, df12Octubre4, df22Octubre1, df22Octubre2, df22Octubre3, df22Octubre4, df2noviembre1, df2noviembre2, df2noviembre3, df2noviembre4, df12noviembre1, df12noviembre2, df12noviembre3, df12noviembre4, df22noviembre1, df22noviembre2, df22noviembre3, df22noviembre4, df2diciembre1, df2diciembre2, df2diciembre3, df2diciembre4)
write.csv(unionTabla, file ='144_TablaEstadisticaPrecipitacionparandvi.csv')


