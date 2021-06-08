library(raster)
library(mapview)
library(rgdal)

km_Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)
mapview(km_Topografic)

Grupo1 <- km_Topografic
Grupo1[Grupo1 != 1] <- NA
plot(Grupo1)

Grupo2 <- km_Topografic
Grupo2[Grupo2 != 2] <- NA
plot(Grupo2)

Grupo3 <- km_Topografic
Grupo3[Grupo3 != 3] <- NA
plot(Grupo3)

Grupo4 <- km_Topografic
Grupo4[Grupo4 != 4] <- NA
plot(Grupo4)

# Dia 12_21 dic 2019

SSM12_21dic2019 <- raster()
plot(SSM12_21dic2019)


MascaraSSM12_21dic2019topo1 <- mask(SSM12_21dic2019, Grupo1)
plot(MascaraSSM12_21dic2019topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo1))[,1])
df12dic1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM12_21dic2019")
write.csv(df12dic1, file ='1_TablaEstadisticaSSM12_21dic2019Grupo1.csv')

MascaraSSM12_21dic2019topo2 <- mask(SSM12_21dic2019, Grupo2)
plot(MascaraSSM12_21dic2019topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo2))[,1])
df12dic2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM12_21dic2019")
write.csv(df12dic2, file ='2_TablaEstadisticaSSM12_21dic2019Grupo2.csv')

MascaraSSM12_21dic2019topo3 <- mask(SSM12_21dic2019, Grupo3)
plot(MascaraSSM12_21dic2019topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo3))[,1])
df12dic3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM12_21dic2019")
write.csv(df12dic3, file ='3_TablaEstadisticaSSM12_21dic2019Grupo3.csv')

MascaraSSM12_21dic2019topo4 <- mask(SSM12_21dic2019, Grupo4)
plot(MascaraSSM12_21dic2019topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21dic2019topo4))[,1])
df12dic4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM12_21dic2019")
write.csv(df12dic4, file ='4_TablaEstadisticaSSM12_21dic2019Grupo4.csv')

# Dia 22 dic 2019 al 1 de enero 2020 (11 dias)

SSM22dic2019_1enero2020 <- raster()
plot(SSM22dic2019_1enero2020)


MascaraSSM22dic2019_1enero2020topo1 <- mask(SSM22dic2019_1enero2020, Grupo1)
plot(MascaraSSM22dic2019_1enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo1))[,1])
df22dic1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM22dic2019_1enero2020")
write.csv(df22dic1, file ='5_TablaEstadisticaSSM22dic2019_1enero2020Grupo1.csv')

MascaraSSM22dic2019_1enero2020topo2 <- mask(SSM22dic2019_1enero2020, Grupo2)
plot(MascaraSSM22dic2019_1enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo2))[,1])
df22dic2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM22dic2019_1enero2020")
write.csv(df22dic2, file ='6_TablaEstadisticaSSM22dic2019_1enero2020Grupo2.csv')

MascaraSSM22dic2019_1enero2020topo3 <- mask(SSM22dic2019_1enero2020, Grupo3)
plot(MascaraSSM22dic2019_1enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo3))[,1])
df22dic3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM22dic2019_1enero2020")
write.csv(df22dic3, file ='7_TablaEstadisticaSSM22dic2019_1enero2020Grupo3.csv')

MascaraSSM22dic2019_1enero2020topo4 <- mask(SSM22dic2019_1enero2020, Grupo4)
plot(MascaraSSM22dic2019_1enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22dic2019_1enero2020topo4))[,1])
df22dic4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM22dic2019_1enero2020")
write.csv(df22dic4, file ='8_TablaEstadisticaSSM22dic2019_1enero2020Grupo4.csv')

# Dia 2 al 11 de enero 2020

SSM2_11enero2020 <- raster()
plot(SSM2_11enero2020)


MascaraSSM2_11enero2020topo1 <- mask(SSM2_11enero2020, Grupo1)
plot(MascaraSSM2_11enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo1))[,1])
df2enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM2_11enero2020")
write.csv(df2enero1, file ='9_TablaEstadisticaSSM2_11enero2020Grupo1.csv')

MascaraSSM2_11enero2020topo2 <- mask(SSM2_11enero2020, Grupo2)
plot(MascaraSSM2_11enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo2))[,1])
df2enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM2_11enero2020")
write.csv(df2enero2, file ='10_TablaEstadisticaSSM2_11enero2020Grupo2.csv')

MascaraSSM2_11enero2020topo3 <- mask(SSM2_11enero2020, Grupo3)
plot(MascaraSSM2_11enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
df2enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM2_11enero2020")
write.csv(df2enero3, file ='11_TablaEstadisticaSSM2_11enero2020Grupo3.csv')

MascaraSSM2_11enero2020topo4 <- mask(SSM2_11enero2020, Grupo4)
plot(MascaraSSM2_11enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo4))[,1])
df2enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM2_11enero2020")
write.csv(df2enero4, file ='12_TablaEstadisticaSSM2_11enero2020Grupo4.csv')


# Dia 12 al 21 de enero 2020

SSM12_21enero2020 <- raster()
plot(SSM12_21enero2020)


MascaraSSM12_21enero2020topo1 <- mask(SSM12_21enero2020, Grupo1)
plot(MascaraSSM12_21enero2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo1))[,1])
df12enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM12_21enero2020")
write.csv(df12enero1, file ='13_TablaEstadisticaSSM12_21enero2020Grupo1.csv')

MascaraSSM12_21enero2020topo2 <- mask(SSM12_21enero2020, Grupo2)
plot(MascaraSSM12_21enero2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo2))[,1])
df12enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM12_21enero2020")
write.csv(df12enero2, file ='14_TablaEstadisticaSSM12_21enero2020Grupo2.csv')

MascaraSSM12_21enero2020topo3 <- mask(SSM12_21enero2020, Grupo3)
plot(MascaraSSM2_11enero2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11enero2020topo3))[,1])
df12enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM12_21enero2020")
write.csv(df12enero3, file ='15_TablaEstadisticaSSM12_21enero2020Grupo3.csv')

MascaraSSM12_21enero2020topo4 <- mask(SSM12_21enero2020, Grupo4)
plot(MascaraSSM12_21enero2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM12_21enero2020topo4))[,1])
df12enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM12_21enero2020")
write.csv(df12enero4, file ='16_TablaEstadisticaSSM12_21enero2020Grupo4.csv')


# Dia 22 de enero al 1 Febrero 2020 (11 dias)

SSM22enero_1febr2020 <- raster()
plot(SSM22enero_1febr2020)


MascaraSSSM22enero_1febr2020topo1 <- mask(SSM22enero_1febr2020, Grupo1)
plot(MascaraSSSM22enero_1febr2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSSM22enero_1febr2020topo1))[,1])
df22enero1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM22enero_1febr2020")
write.csv(df22enero1, file ='17_TablaEstadisticaSSM22enero_1febr2020Grupo1.csv')

MascaraSSM22enero_1febr2020topo2 <- mask(SSM22enero_1febr2020, Grupo2)
plot(MascaraSSM22enero_1febr2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo2))[,1])
df22enero2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM22enero_1febr2020")
write.csv(df22enero2, file ='18_TablaEstadisticaSSM22enero_1febr2020Grupo2.csv')

MascaraSSM22enero_1febr2020topo3 <- mask(SSM22enero_1febr2020, Grupo3)
plot(MascaraSSM22enero_1febr2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo3))[,1])
df22enero3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM22enero_1febr2020")
write.csv(ddf22enero3, file ='19_TablaEstadisticaSSM22enero_1febr2020Grupo3.csv')

MascaraSSM22enero_1febr2020topo4 <- mask(SSM22enero_1febr2020, Grupo4)
plot(MascaraSSM22enero_1febr2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM22enero_1febr2020topo4))[,1])
df12enero4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM22enero_1febr2020")
write.csv(df12enero4, file ='20_TablaEstadisticaSSM22enero_1febr2020Grupo4.csv')


# Dia 2 al 11 Febrero 2020 (11 dias)

SSM2_11febr2020 <- raster()
plot(SSM2_11febr2020)


MascaraSSM2_11febr2020topo1 <- mask(SSM2_11febr2020, Grupo1)
plot(MascaraSSM2_11febr2020topo1)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo1))[,1])
df2Febre1 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo1", variable= "SSM2_11febr2020")
write.csv(df2Febre1, file ='21_TablaEstadisticaSSM2_11febr2020Grupo1.csv')

MascaraSSM2_11febr2020topo2 <- mask(SSM2_11febr2020, Grupo2)
plot(MascaraSSM2_11febr2020topo2)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo2))[,1])
df2Febre2 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo2", variable= "SSM2_11febr2020")
write.csv(df2Febre2, file ='22_TablaEstadisticaSSM2_11febr2020Grupo2.csv')

MascaraSSM2_11febr2020topo3 <- mask(SSM2_11febr2020, Grupo3)
plot(MascaraSSM2_11febr2020topo3)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo3))[,1])
df2Febre3 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo3", variable= "SSM2_11febr2020")
write.csv(df2Febre3, file ='23_TablaEstadisticaSSM2_11febr2020Grupo3.csv')

MascaraSSM2_11febr2020topo4 <- mask(SSM2_11febr2020, Grupo4)
plot(MascaraSSM2_11febr2020topo4)
minimo <- min(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
maximo <- max(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
medio <- mean(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
mediana <- median(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
desvia <- sd(na.omit(as.data.frame(MascaraSSM2_11febr2020topo4))[,1])
df2Febre4 <- data.frame(min=minimo, max=maximo, mean=medio, median=mediana, sd= desvia, Grupo="Grupo4", variable= "SSM2_11febr2020")
write.csv(df2Febre4, file ='24_TablaEstadisticaSSM2_11febr2020Grupo4.csv')

