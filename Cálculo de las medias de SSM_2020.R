# ubicación del directorio de trabajo
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/1_Enero_SSM_Bir_2020")

#Cargar librería raster 
library(raster)

#Unificar archivos
s <- stack(list.files(pattern = ".nc"), varname="ssm")

#Cargar libreria Map
library(maps)
plot(extent(s))
#Colocar el mapa mundial
maps:: map("world", add =TRUE)

# colección de rasters de un subconjunto de datos

#Extención del area de investigación
ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
#
A <- stack(crop(s, ex))

# Data frame 
df <- as.data.frame(A, xy=TRUE)
plot(A)

#CÁLCULO DE LAS MEDIAS

#cinco dias antes del 11 y el mismo 11 de enero 2020
diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
?calc
plot(diaSSM_6_11na_true)
writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_enero_6dias.tif")

#cinco dias antes del dia 21 de enero 2020
diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
plot(diaSSM_16_21na_true)
writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_enero_6dias.tif")

# Para el día 1 de enero
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/0_Diciembre_SSM_BioPar_1km_2019")

#cinco dias antes de 1 de enero 
diaSSM_27_31_dic2019na_true <- calc(A[[2:6]], mean, na.rm=TRUE)
plot(diaSSM_27_31_dic2019na_true)

#Ubicación
sEnero1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/1_Enero_SSM_Bir_2020/c_gls_SSM1km_202001010000_CEURO_S1CSAR_V1.1.1.nc",varname="ssm")

#Recorte objeto
sEnero1 <- crop(sEnero1, diaSSM_27_31_dic2019na_true)

#Agrupar en un mismo stack desde el dia 27 de diciembre 2019 al 1 de enero 2020.
diaSSM27dic2019_1ene2020na_true <- stack(sEnero1, diaSSM_27_31_dic2019na_true )
diaSSM27dic2019_1ene2020na_true <- calc(diaSSM27dic2019_1ene2020na_true, mean, na.rm=TRUE)
plot(diaSSM27dic2019_1ene2020na_true)
writeRaster(diaSSM27dic2019_1ene2020na_true, file="DiaSSM27dic2019_1ene2020na_true_6dias.tif")


##MES DE FEBRERO
#Ubicación
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/2_Febrero")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 y el mismo 11 de febrero 2020
 diaSSM_6_11Feb_na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11Feb_na_true)
 writeRaster(diaSSM_6_11Feb_na_true, file="diaSSM_6_11Feb_na_true_dias.tif")
 
 #cinco dias antes del dia 21 de febrero 2020
 diaSSM_16_21Feb_na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot( diaSSM_16_21Feb_na_true)
 writeRaster( diaSSM_16_21Feb_na_true, file=" diaSSM_16_21Feb_na_true_6dias.tif")
 
 #Día 1 de Febrero
 
 #Se utilizaran los 5 dias antes de febrero y el primero del mismo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/1_Enero_SSM_Bir_2020")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 plot(A)
 
  #cinco dias antes de 1 de febrero los dias 30 y 31 HAY GRANDES HUECOS DE INFORMACIÓN  de la zona centro de España 
 diaSSM_27_31_enero2020na_true <- calc(A[[27:31]], mean, na.rm=TRUE)
 plot(diaSSM_27_31_enero2020na_true)
 writeRaster(diaSSM_27_31_enero2020na_true, file="diaSSM27_31ene2020na_1F_true.tif")
  
 #Día 1 de febrero
 sFebr1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/2_Febrero/c_gls_SSM1km_202002010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 
 #Recorte objeto
 sFebr1 <- crop(sFebr1, diaSSM_27_31_enero2020na_true)
 
 #Agrupar en un mismo stack desde el dia 27 de diciembre 2019 al 1 de enero 2020.
 diaSSM27ene2020_1Feb2020na_true <- stack(sFebr1, diaSSM_27_31_enero2020na_true )
 diaSSM27ene2020_1Feb2020na_true <- calc(diaSSM27ene2020_1Feb2020na_true, mean, na.rm=TRUE)
 plot(diaSSM27ene2020_1Feb2020na_true)
 writeRaster(diaSSM27ene2020_1Feb2020na_true, file="DíaSSM27ene2020_1Feb2020na_true.tif")

 
 ## MES DE MARZO
 
 #Ubicación de archivo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/3_Marzo")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 de Marzo y el mismo 11 de marzo 2020
 diaSSM_6_11Mar_na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11Mar_na_true)
 writeRaster(diaSSM_6_11Mar_na_true, file="diaSSM_6_11Mar_na_true.tif")
 
 #cinco dias antes del dia 21 de marzo y el mismo 21, 2020
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_Mar_na_true.tif")
 
 # Para el día 1 de Marzo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/2_Febrero")
 
 # se utilizaran 5 dias antes de marzo 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 plot(A)
 
 #cinco dias antes de 1 de marzo los dias 25 y 29 de febrero 
 diaSSM_25_29_Feb2020na_true <- calc(A[[25:29]], mean, na.rm=TRUE)
 plot(diaSSM_25_29_Feb2020na_true)
 writeRaster(diaSSM_25_29_Feb2020na_true, file="diaSSM_25_29_Feb2020_1M_na_true_true.tif")
 
 #Día 1 de febrero
 # ubicación
 sMarzo1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/3_Marzo/c_gls_SSM1km_202003010000_CEURO_S1CSAR_V1.1.1.nc", varname = "ssm")
 
 #Recorte objeto
 sMarzo1 <- crop(sMarzo1, diaSSM_25_29_Feb2020na_true)
 
 #Agrupar en un mismo stack desde el dia 25 de Febrero 2020 al 1 de Marzo 2020.
 diaSSM25Feb2020_1Mar2020na_true <- stack(sMarzo1, diaSSM_25_29_Feb2020na_true )
 diaSSM25Feb2020_1Mar2020na_true <- calc(diaSSM25Feb2020_1Mar2020na_true, mean, na.rm=TRUE)
 plot(diaSSM25Feb2020_1Mar2020na_true)
 writeRaster(diaSSM25Feb2020_1Mar2020na_true, file="diaSSM25Feb2020_1Mar2020_1Mna_true.tif")
 
 #MES DE ABRIL
 #Ubicación de archivos
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/4_Abril")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 y el mismo 11 de abril 2020
 
 diaSSM_6_11Abri_na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11Abri_na_true)
 writeRaster(diaSSM_6_11Abri_na_true, file="diaSSM_6_11Abril_na_true.tif")
 
 #cinco dias antes del dia 21 de Abril y el mismo 21, 2020
 diaSSM_16_21Abrilna_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21Abrilna_true)
 writeRaster(diaSSM_16_21Abrilna_true, file="DíaSSM_16_21_Abril_na_true.tif")
 
 # Para el día 1 de Abril
 
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/3_Marzo")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 plot(A)
 
 ##se utilizan los cinco dias anteriores (que son del 27 al 31 de marzo)
 diaSSM_27_31_Mar2020na_true <- calc(A[[27:31]], mean, na.rm=TRUE)
 plot(diaSSM_27_31_Mar2020na_true)
 writeRaster(diaSSM_27_31_Mar2020na_true, file="diaSSM_27_31_Mar2020na_true.tif")
 
 #Día 1 de Abril
 # ubicación
 sAbril1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/4_Abril/c_gls_SSM1km_202004010000_CEURO_S1CSAR_V1.1.1.nc", varname = "ssm")
 #Recorte objeto
 sAbril1 <- crop(sAbril1, diaSSM_27_31_Mar2020na_true)
 
 #Agrupar en un mismo stack desde el dia 27 de Marzo 2020 al 1 de Abril 2020.
 diaSSM27Mar2020_1Abri2020na_true <- stack(sAbril1, diaSSM_27_31_Mar2020na_true )
 diaSSM27Mar2020_1Abri2020na_true <- calc( diaSSM27Mar2020_1Abri2020na_true, mean, na.rm=TRUE)
 plot( diaSSM27Mar2020_1Abri2020na_true)
 writeRaster(diaSSM27Mar2020_1Abri2020na_true, file="diaSSM27Mar2020_1Abri2020na_true_1Ab.tif")

 #MES DE MAYO
 
 #Ubicación del archivo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/5_Mayo")
 
 #Cargar librería raster 
 library(raster)
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 y el mismo 11 de Mayo 2020
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_mayo.tif")
 
 #Cinco dias antes del dia 21 de mayo 2020
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_Mayo_correcta.tif")
 
 # Para el DÍA 1 de Mayo
 #ubicación abril
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/4_Abril")
 
 # se utilizaran 5 dias antes de Mayo
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 plot(A)
 
 #cinco dias antes de 1 de Mayo los dias 26 y 30 de Abril 
 diaSSM_26_30_Abril2020na_true <- calc(A[[26:30]], mean, na.rm=TRUE)
 plot(diaSSM_26_30_Abril2020na_true)
 writeRaster(diaSSM_26_30_Abril2020na_true, file="diaSSM_26_30_Abril2020_na_true.tif")
 
 #Día 1 de Mayo
 # ubicación
 sMayo1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/5_Mayo/c_gls_SSM1km_202005010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 #Recorte objeto
 sMayo1 <- crop(sMayo1, diaSSM_26_30_Abril2020na_true)
 
 #Agrupar en un mismo stack desde el dia 26 de ABRIL 2020 al 1 de MAYO 2020.
 diaSSM26Abril2020_1May2020na_true <- stack(sMayo1, diaSSM_26_30_Abril2020na_true )
 diaSSM26Abril2020_1May2020na_true <- calc( diaSSM26Abril2020_1May2020na_true, mean, na.rm=TRUE)
 plot(diaSSM26Abril2020_1May2020na_true)
 writeRaster(diaSSM26Abril2020_1May2020na_true, file="diaSSM26Abril2020_1May2020na_true_1My.tif")

 #MES DE JUNIO
 
 #Ubicación de archivos
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/6_Junio")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 y el mismo 11 de Junio 2020
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Junio_correcta.tif")
 
 #cinco dias antes del dia 21 de Junio 2020
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_Junio_correcta.tif")
 
 # Para el día 1 de Junio 
 
 #ubicación Mayo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/5_Mayo")
 # se utilizaran 5 dias antes de Junio

  #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 plot(A)

 #cinco dias antes de 1 de Junio los dias 27 y 31 de Mayo SON 7 Dias 
 diaSSM_27_31_Mayo2020na_true <- calc(A[[27:31]], mean, na.rm=TRUE)
 plot(diaSSM_27_31_Mayo2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_27_31_Mayo2020na_true, file="diaSSM_27_31_Mayo2020na_correcta_1Jn_5dias.tif")
 
 #EVALUAR SI COLOCAR EL 1 DE JUNIO, YA QUE SERIAN ¿?
 
 #Día 1 de Junio
 # ubicación
 sJunio1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/6_Junio/c_gls_SSM1km_202006010000_CEURO_S1CSAR_V1.1.1.nc",varname="ssm" )
 
 #Recorte objeto
 sJunio1 <- crop(sJunio1, diaSSM_27_31_Mayo2020na_true)
 
 #Agrupar en un mismo stack desde el dia 25 de MAYO 2020 al 1 de JUNIO 2020. 
 diaSSM27Mayo2020_1Jun2020na_true <- stack(sJunio1, diaSSM_27_31_Mayo2020na_true)
 diaSSM27Mayo2020_1Jun2020na_true <- calc(diaSSM27Mayo2020_1Jun2020na_true, mean, na.rm=TRUE)
 plot(diaSSM27Mayo2020_1Jun2020na_true)
 writeRaster(diaSSM27Mayo2020_1Jun2020na_true, file="diaSSM27Mayo2020_1Jun2020na_true_1Jn_6dias.tif")
 
 ##MES DE JULIO
 
 #Ubicación del archivo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/7_Julio")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 #cinco dias antes del 11 y el mismo 11 de Julio 2020
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Julio_Correcta_hueco_6dias.tif")
 
 # cinco dias antes del dia 16 al 21 de JULIO 2020_ HAY ERROR EN LOS DATOS si lo corro otra vez aprarece otra cosa
 diaSSM_16_21Jna_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21Jna_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_16_21Jna_true, file="DiaSSM_16_21_Julio_muchosHuecos_6dias.tif")
 
 # Para el día 1 de Julio
 #Ubicación de carpeta de Junio
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/6_Junio")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #cinco dias antes de 1 Julio
 diaSSM_26_30_Jun2020na_true <- calc(A[[26:30]], mean, na.rm=TRUE)
 plot(diaSSM_26_30_Jun2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_26_30_Jun2020na_true, file="DiaSSM_26_30_Jun_hueco_True.tif")
 
 #Unificar del dia 26 Junio al 1 de Julio
 sJulio1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/7_Julio/c_gls_SSM1km_202007010000_CEURO_S1CSAR_V1.1.1.nc",varname="ssm")
 
 #Recorte objeto
 sJulio1 <- crop(sJulio1, diaSSM_26_30_Jun2020na_true)
 
 #Agrupar en un mismo stack desde el dia 24 de Junio 2020 al 1 de Julio 2020
 
 diaSSM26Jun2020_1Jul2020na_true <- stack(sJulio1, diaSSM_26_30_Jun2020na_true)
 diaSSM26Jun2020_1Jul2020na_true <- calc(diaSSM26Jun2020_1Jul2020na_true, mean, na.rm=TRUE)
 plot(diaSSM26Jun2020_1Jul2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM26Jun2020_1Jul2020na_true, file="DíaSSM26Jun2020_1Jul2020_6dias.tif")

 ##MES AGOSTO 2020
 
 #Ubicación del archivo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/8_Agosto")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 # cinco dias antes del 11 y el mismo 11 de Agosto 2020, HAY MUCHOS HUECOS
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Agosto_Huecos_6dias.tif")
 
 # OJO (SOLO CON 10 DIAS ANTES SE CUBRE la mayor parte) cinco dias antes del dia 16 al 21 de Agosto 2020,  hay huecos para Aragon
 diaSSM_16_21Agona_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21Agona_true)
 maps:: map("world", add =TRUE)
 writeRaster( diaSSM_16_21Agona_true, file="DiaSSM_16_21_Agosto_Huecos_6dias_correcta.tif")
 
 # Para el día 1 de Agosto
 #Ubicación de carpeta de Julio
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/7_Julio")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #OJO MUCHOS HUECOS, DESDE cinco dias antes de 1 Agosto
 diaSSM_27_31_JL2020na_true <- calc(A[[27:31]], mean, na.rm=TRUE)
 plot(diaSSM_27_31_JL2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_27_31_JL2020na_true, file="DiaSSM_27_31_Jul_Huecos_5dia.tif")
 
 #Unificar del dia 27 Julio al 1 de Agosto
 sAgos1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/8_Agosto/c_gls_SSM1km_202008010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 
 #Recorte objeto
 sAgos1 <- crop( sAgos1, diaSSM_27_31_JL2020na_true)
 
 #Agrupar en un mismo stack desde el dia 27 de Jul 2020 al 1 de Ago 2020_ Huecos de información
 diaSSM27Jul2020_1Ago2020na_true <- stack( sAgos1, diaSSM_27_31_JL2020na_true )
 diaSSM27Jul2020_1Ago2020na_true <- calc(diaSSM27Jul2020_1Ago2020na_true, mean, na.rm=TRUE)
 plot(diaSSM27Jul2020_1Ago2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM27Jul2020_1Ago2020na_true, file="DíaSSM27Jul2020_1Ago2020_Mayores_hueco_true_6dias.tif")

 ## MES DE SEPTIEMBRE 
 
 #Ubicación del archivo
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/9_Septiembre")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 # cinco dias antes del 11_sep, OJO_ DIEZ dias antes del 11 y el mismo 11 de Septiembre 2020, HAY MUCHOS HUECOS
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Septiembre_Huecos_informa_6dias_correto.tif")
 
 # cinco dias antes del 21_sep; OJO (SOLO CON 8 DIAS ANTES SE la mayor parte) dias antes, del dia 14 al 21 de Septiembre 2020,  hay huecos en la zona norte.
 diaSSM_16_21Sepna_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21Sepna_true)
 maps:: map("world", add =TRUE)
 writeRaster( diaSSM_16_21Sepna_true, file="DiaSSM_16_21_Septiembre_Huecos_6dias.tif")
 
 # Para el día 1 Septiembre 
 #Ubicación de carpeta de Agosto
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/8_Agosto")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 # cinco dias antes de 1 Septiembre
 diaSSM_27_31_Ag2020 <- calc (A[[27:31]], mean, na.rm=TRUE)
 plot(diaSSM_27_31_Ag2020)
 maps:: map("world", add =TRUE)
 writeRaster (diaSSM_27_31_Ag2020, file="DiaSSM_27_31_Agosto_Huecos_5dia.tif")
 
 #Unificar del dia 27 Julio al 1 de Agosto
 sSept1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/9_Septiembre/c_gls_SSM1km_202009010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 #Recorte objeto
 sSept1 <- crop( sSept1, diaSSM_27_31_Ag2020)
 
 #Agrupar en un mismo stack desde el dia 27 de Ago 2020 al 1 de Sep 2020_ Huecos de información
 diaSSM27Ago2020_1Sep2020na_true <- stack( sAgos1, diaSSM_27_31_Ag2020 )
 diaSSM27Ago2020_1Sep2020na_true <- calc(diaSSM27Ago2020_1Sep2020na_true, mean, na.rm=TRUE)
 plot(diaSSM27Ago2020_1Sep2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM27Ago2020_1Sep2020na_true, file="DíaSSM27Ago2020_1Sep2020_Mayores_hueco_na_true_6dias.tif")
 
## MES DE OCTUBRE
 
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/10_Octubre")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 # cinco dias antes del 11_OCTUBRE, Cinco dias antes del 11 y el mismo 11 de Octubre 2020, HAY algunos HUECOS
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Octubre_pequeñoHuecos_6dias_correto.tif")
 
 # cinco dias antes del 21_OCTUBRE, y el  mismo 21 de Octubre 2020, HAY muchos HUECOS
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_Octubre_Huecos_6dias_correto.tif")
 
 # Para el día 1 OCTUBRE
 
 #Ubicación de carpeta de Septiembre
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/9_Septiembre")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 # cinco dias antes de 1 Octubre 
 diaSSM_26_30_Sep2020 <- calc (A[[26:30]], mean, na.rm=TRUE)
 plot( diaSSM_26_30_Sep2020 )
 maps:: map("world", add =TRUE)
 writeRaster ( diaSSM_26_30_Sep2020 , file="DiaSSM_26_30_Sep_Huecos_5dia.tif")
 
 #Unificar del dia 26 Sep al 1 de Octubre
 sOCTU1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/10_Octubre/c_gls_SSM1km_202010010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 #Recorte objeto
 sOCTU1<- crop( sOCTU1, diaSSM_26_30_Sep2020)
 
 #Agrupar en un mismo stack desde el dia 26 de Sept 2020 al 1 de Octubre 2020_ Huecos de información
 diaSSM26Sep2020_1Octubre2020na_true <- stack( sOCTU1, diaSSM_26_30_Sep2020 )
 diaSSM26Sep2020_1Octubre2020na_true <- calc(diaSSM26Sep2020_1Octubre2020na_true, mean, na.rm=TRUE)
 plot(diaSSM26Sep2020_1Octubre2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM26Sep2020_1Octubre2020na_true, file="DíaSSM26Sep2020_1Octubre2020_Mayores_hueco_na_true_6dias.tif")
 
 
 
 ##MES NOVIEMBRE
 #UBICACIÓN ARCHIVO
 
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/11_Noviembre")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 # cinco dias antes del 11_NOVIEMBRE, Cinco dias antes del 11 y el mismo 11 de Nov 2020, HAY algunos HUECOS
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Noviembre_Huecos_6dias_correcto.tif")
 
 # cinco dias antes del 21_NOVIEMBRE, y el  mismo 21 de NOVIEMBRE 2020, Hay pocos HUECOS
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_NOVIEMBRE_Huecos_6dias_correcto.tif")
 
 # Para el día 1 NOVIEMBRE
 
 #Ubicación de carpeta de Octubre
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/10_Octubre")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 # cinco dias antes de 1 Noviembre 
 diaSSM_27_31_Octu2020 <- calc (A[[27:31]], mean, na.rm=TRUE)
 plot( diaSSM_27_31_Octu2020 )
 maps:: map("world", add =TRUE)
 writeRaster ( diaSSM_27_31_Octu2020 , file="DiaSSM_27_31_Octubre_Huecos_5dia.tif")
 
 #Unificar del dia 27 Octubre al 1 de Noviembre
 sNov1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/11_Noviembre/c_gls_SSM1km_202011010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 #Recorte objeto
 sNov1<- crop(  sNov1, diaSSM_27_31_Octu2020)
 
 #Agrupar en un mismo stack desde el dia 27 Octubre 2020 al 1 de Noviembre 2020_ Huecos de información
 diaSSM27Oct2020_1Nov2020na_true <- stack(  sNov1, diaSSM_27_31_Octu2020 )
 diaSSM27Oct2020_1Nov2020na_true <- calc(diaSSM27Oct2020_1Nov2020na_true, mean, na.rm=TRUE)
 plot(diaSSM27Oct2020_1Nov2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM27Oct2020_1Nov2020na_true, file="DíaSSM27Octu2020_1Nov2020_na_true_6dias.tif")

 
 # MES DICIEMBRE 
 #UBICACIÓN ARCHIVO
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/12_Diciembre")
 
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 #CÁLCULO DE LAS MEDIAS
 
 # cinco dias antes del 11_Diciembre, Cinco dias antes del 11 y el mismo 11 de Dic 2020, HAY algunos HUECOS
 diaSSM_6_11na_true <- calc(A[[6:11]], mean, na.rm=TRUE)
 plot(diaSSM_6_11na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_6_11na_true, file="DíaSSM_6_11_Diciembre_6dias_correcto.tif")
 
 # cinco dias antes del 21_Diciembre, y el  mismo 21 de Diciembre 2020, Hay pocos HUECOS
 diaSSM_16_21na_true <- calc(A[[16:21]], mean, na.rm=TRUE)
 plot(diaSSM_16_21na_true)
 maps:: map("world", add =TRUE)
 writeRaster(diaSSM_16_21na_true, file="DíaSSM_16_21_Diciembre_Huecos_6dias_correcto.tif")
 
 # Para el día 1 Diciembre
 
 #Ubicación de carpeta de Noviembre
 setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/11_Noviembre")
 #Unificar archivos
 s <- stack(list.files(pattern = ".nc"), varname="ssm")
 #Cargar libreria Map
 library(maps)
 plot(extent(s))
 #Colocar el mapa mundial
 maps:: map("world", add =TRUE)
 
 # colección de rasters de un subconjunto de datos
 #
 ex <- extent(-10.13393, 6.169643, 35.48214, 43.91964)
 #
 A <- stack(crop(s, ex))
 
 # Data frame 
 df <- as.data.frame(A, xy=TRUE)
 plot(A)
 
 # cinco dias antes de 1 Diciembre 
 diaSSM_26_30_nov2020 <- calc (A[[26:30]], mean, na.rm=TRUE)
 plot( diaSSM_26_30_nov2020 )
 maps:: map("world", add =TRUE)
 writeRaster ( diaSSM_26_30_nov2020 , file="DiaSSM_26_30_Nov_Huecos_5dia.tif")
 
 #Unificar del dia 26 noviembre al 1 de diciembre
 sDic1 <- stack("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/12_Diciembre/c_gls_SSM1km_202012010000_CEURO_S1CSAR_V1.1.1.nc", varname="ssm")
 #Recorte objeto
 sDic1<- crop(  sDic1, diaSSM_26_30_nov2020)
 
 #Agrupar en un mismo stack desde el dia 27 Octubre 2020 al 1 de Noviembre 2020_ Huecos de información
 diaSSM26Nov2020_1Dic2020na_true <- stack(  sDic1, diaSSM_26_30_nov2020 )
 diaSSM26Nov2020_1Dic2020na_true <- calc( diaSSM26Nov2020_1Dic2020na_true, mean, na.rm=TRUE)
 plot( diaSSM26Nov2020_1Dic2020na_true)
 maps:: map("world", add =TRUE)
 writeRaster( diaSSM26Nov2020_1Dic2020na_true, file="DíaSSM26Nov2020_1DIC2020_na_true_6dias.tif")
 