#TEMPERATURA mensual (ºC)


#Cargar librería raster 
library(raster)
library(rgdal)


#Ubicación tEMPERATURA
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12_Promedio de Temperatura mensual")
# Limites
#limn <- getData('GADM', country='ESP', level=2)
#plot(limn)

#Unificar archivos
s <- stack(list.files(pattern = ".tif"))
ex <- extent(-9.4, 4.4, 35.2, 43.9)
Temp <- stack(crop(s, ex))

#Variable Topografi
km_Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)

#Cobertura con la mascra del dia 1 de NDVI
#MascaraCober <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/1_Dia1_enero2020ndvi_maskCobe.tif")
#plot(MascaraCober)

mas <- mask(resample(Temp, km_Topografic), km_Topografic, method= 'ngb')
mas <- (mas*0.1)


# 12 diciembre 2019 al 11 enero 2020
Tempertaruradia1 <-mas[[1]] 
Tempertaruradia1[Tempertaruradia1 < 0]<- NA
plot(Tempertaruradia1)

# 12 enero 2020 al 11 febrero 2020
Tempertaruradia2 <-mas[[2]] 
Tempertaruradia2[Tempertaruradia2 < 0]<- NA
plot(Tempertaruradia2)

# 12 febrero 2020 al 11 marzo 2020
Tempertaruradia3 <-mas[[3]] 
Tempertaruradia3[Tempertaruradia3 < 0]<- NA
plot(Tempertaruradia3)

# 12 marzo 2020 al 11 abril 2020
Tempertaruradia4 <-mas[[4]] 
Tempertaruradia4[Tempertaruradia4 < 0]<- NA
plot(Tempertaruradia4)

# 12 abril 2020 al 11 mayo 2020
Tempertaruradia5 <-mas[[5]] 
Tempertaruradia5[Tempertaruradia5 < 0]<- NA
plot(Tempertaruradia5)

# 12 mayo 2020 al 11 junio 2020
Tempertaruradia6 <-mas[[6]] 
Tempertaruradia6[Tempertaruradia6 < 0]<- NA
plot(Tempertaruradia6)

# 12 junio 2020 al 11 julio 2020
Tempertaruradia7 <-mas[[7]] 
Tempertaruradia7[Tempertaruradia7 < 0]<- NA
plot(Tempertaruradia7)

# 12 julio 2020 al 11 agosto 2020
Tempertaruradia8 <-mas[[8]] 
Tempertaruradia8[Tempertaruradia8 < 0]<- NA
plot(Tempertaruradia8)

# 12 agosto 2020 al 11 septiembre 2020
Tempertaruradia9 <-mas[[9]] 
Tempertaruradia9[Tempertaruradia9 < 0]<- NA
plot(Tempertaruradia9)

# 12 septiembre 2020 al 11 octubre 2020
Tempertaruradia10 <-mas[[10]] 
Tempertaruradia10[Tempertaruradia10 < 0]<- NA
plot(Tempertaruradia10)

# 12 octubre 2020 al 11 noviembre 2020
Tempertaruradia11 <-mas[[11]] 
Tempertaruradia11[Tempertaruradia11 < 0]<- NA
plot(Tempertaruradia11)

# 12 noviembre 2020 al 11 diciembre 2020
Tempertaruradia12 <-mas[[12]] 
Tempertaruradia12[Tempertaruradia12 < 0]<- NA
plot(Tempertaruradia12)

writeRaster(Tempertaruradia1, file="01TEMPN.tif")
writeRaster(Tempertaruradia2, file="02TEMPN.tif")
writeRaster(Tempertaruradia3, file="03TEMPN.tif")
writeRaster(Tempertaruradia4, file="04TEMPN.tif")
writeRaster(Tempertaruradia5, file="05TEMPN.tif")
writeRaster(Tempertaruradia6, file="06TEMPN.tif")
writeRaster(Tempertaruradia7, file="07TEMPN.tif")
writeRaster(Tempertaruradia8, file="08TEMPN.tif")
writeRaster(Tempertaruradia9, file="09TEMPN.tif")
writeRaster(Tempertaruradia10, file="10TEMPN.tif")
writeRaster(Tempertaruradia11, file="11TEMPN.tif")
writeRaster(Tempertaruradia12, file="12TEMPN.tif")