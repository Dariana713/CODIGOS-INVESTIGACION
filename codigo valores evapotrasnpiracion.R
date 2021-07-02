#Evapotranspiracion de referencia mensual (mm)


#Cargar librería raster 
library(raster)
library(rgdal)


#Ubicación ET
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/Evapotrasnpiración")

#Unificar archivos
s <- stack(list.files(pattern = ".tif"))
ex <- extent(-9.4, 4.4, 35.2, 43.9)
ET <- stack(crop(s, ex))

#Variable Topografi
km_Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)

#Cobertura con la mascra del dia 1 de NDVI
#MascaraCober <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/1_Dia1_enero2020ndvi_maskCobe.tif")
#plot(MascaraCober)

mas <- mask(resample(ET, km_Topografic), km_Topografic, method= 'ngb')
mas <- (mas*0.1)

#Reproyectada a 1 km, ya que estaba en 5 km y estan con vecinos cercanos
#Prc_pro <- projectRaster(mas, km_Topografic)
#plot(Prc_pro)

# 12 diciembre 2019 al 11 enero 2020
Evaporacion1 <-mas[[1]] 
Evaporacion1[Evaporacion1 < 0]<- NA
plot(Evaporacion1)

# 12 enero 2020 al 11 febrero 2020
Evaporacion2 <-mas[[2]] 
Evaporacion2[Evaporacion2 < 0]<- NA
plot(Evaporacion2)

# 12 febrero 2020 al 11 marzo 2020
Evaporacion3 <-mas[[3]] 
Evaporacion3[Evaporacion3 < 0]<- NA
plot(Evaporacion3)

# 12 marzo 2020 al 11 abril 2020
Evaporacion4 <-mas[[4]] 
Evaporacion4[Evaporacion4 < 0]<- NA
plot(Evaporacion4)

# 12 abril 2020 al 11 mayo 2020
Evaporacion5 <-mas[[5]] 
Evaporacion5[Evaporacion5 < 0]<- NA
plot(Evaporacion5)

# 12 mayo 2020 al 11 junio 2020
Evaporacion6 <-mas[[6]] 
Evaporacion6[Evaporacion6 < 0]<- NA
plot(Evaporacion6)

# 12 junio 2020 al 11 julio 2020
Evaporacion7 <-mas[[7]] 
Evaporacion7[Evaporacion7 < 0]<- NA
plot(Evaporacion7)

# 12 julio 2020 al 11 agosto 2020
Evaporacion8 <-mas[[8]] 
Evaporacion8[Evaporacion8 < 0]<- NA
plot(Evaporacion8)

# 12 agosto 2020 al 11 septiembre 2020
Evaporacion9 <-mas[[9]] 
Evaporacion9[Evaporacion9 < 0]<- NA
plot(Evaporacion9)

# 12 septiembre 2020 al 11 octubre 2020
Evaporacion10 <-mas[[10]] 
Evaporacion10[Evaporacion10 < 0]<- NA
plot(Evaporacion10)

# 12 octubre 2020 al 11 noviembre 2020
Evaporacion11 <-mas[[11]] 
Evaporacion11[Evaporacion11 < 0]<- NA
plot(Evaporacion11)

# 12 noviembre 2020 al 11 diciembre 2020
Evaporacion12 <-mas[[12]] 
Evaporacion12[Evaporacion12 < 0]<- NA
plot(Evaporacion12)

writeRaster(Evaporacion1, file="01ETN.tif")
writeRaster(Evaporacion2, file="02ETN.tif")
writeRaster(Evaporacion3, file="03ETN.tif")
writeRaster(Evaporacion4, file="04ETN.tif")
writeRaster(Evaporacion5, file="05ETN.tif")
writeRaster(Evaporacion6, file="06ETN.tif")
writeRaster(Evaporacion7, file="07ETN.tif")
writeRaster(Evaporacion8, file="08ETN.tif")
writeRaster(Evaporacion9, file="09ETN.tif")
writeRaster(Evaporacion10, file="10ETN.tif")
writeRaster(Evaporacion11, file="11ETN.tif")
writeRaster(Evaporacion12, file="12ETN.tif")