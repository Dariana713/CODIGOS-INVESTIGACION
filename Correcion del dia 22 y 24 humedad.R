library(raster)
MascaraCober <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/1_Dia1_enero2020ndvi_maskCobe.tif")
plot(MascaraCober)


# ubicación del directorio de trabajo
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Datos humedad finales julio principio ago")

#Unificar archivos
s <- stack(list.files(pattern = ".nc"), varname="ssm", quick=TRUE)

e <- extent(MascaraCober)
#Cargar libreria Map
#library(maps
#plot(extent(s))
#Colocar el mapa mundial
#maps:: map("world", add =TRUE)

# colección de rasters de un subconjunto de datos

#Extención del area de investigación
ex <- extent(-9.4, 4.4, 35.2, 43.9)
#
A <- stack(crop(s, ex))
#MASCARA COBERTURA
Mascarassm <- crop(A, MascaraCober)
Mascarassm <- mask(A, MascaraCober)
plot(Mascarassm)
#Mascarassm1 <- mask(Mascarassm, MascaraCober)
#plot(Mascarassm)

#22 dias 
diaSSM12_21JULIO2020na_true <- calc(A[[1:10]], mean, na.rm=TRUE)
diaSSM12_21JULIO2020na_true[diaSSM12_21JULIO2020na_true> 100] <- NA
diaSSM12_21JULIO2020na_true1<- mask(diaSSM12_21JULIO2020na_true, MascaraCober)
plot( diaSSM12_21JULIO2020na_true1)
writeRaster(diaSSM12_21JULIO2020na_true1, file="22_DiaSSM12_21JULIO2020na_true_CORREGIDO_SIN_MASK.tif")

#24dias 
diaSSM2_11AGO2020na_true <- calc(Mascarassm[[22:31]], mean, na.rm=TRUE)
diaSSM2_11AGO2020na_true[diaSSM2_11AGO2020na_true> 100] <- NA
plot(diaSSM2_11AGO2020na_true)
writeRaster(diaSSM2_11AGO2020na_true, file="24_DiaSSM2_11JAGOSTO2020na_true_CORREGIDO_SIN_MASK.tif")




#Datos a corregir 
JUL22 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/NDVI/36 SSM/22_PromedioDíaSSM_12_21julio2020_21.tif")
plot(JUL22)

JUL24 <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/NDVI/36 SSM/24_PromedioDíaSSM_2_11agosto2020_11.tif")
plot(JUL24)
writeRaster(diaSSM_26_30_Jun2020na_true, file="DiaSSM_26_30_Jun_hueco_True.tif")
