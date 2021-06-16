#Precipitacion diaria (mm / día)

#para hacer promedios de 10 dias antes del dia de NDVI que abarca 
#los dias promedios de humedad 


#Cargar librería raster 
library(raster)
library(rgdal)
library(mapview)


#Ubicación Precipitación
setwd("~/Codigos Inves_DIAV/Datos Precipitación")
# Limites
#limn <- getData('GADM', country='ESP', level=2)
#plot(limn)

#Unificar archivos
s <- stack(list.files(pattern = ".tif"))
ex <- extent(-9.4, 4.4, 35.2, 43.9)
P <- stack(crop(s, ex))

#Variable Topografi
km_Topografic <- raster("C:/Users/diavivel/Documents/Codigos Inves_DIAV/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)

#Cobertura con la mascra del dia 1 de NDVI
MascaraCober <- raster("C:/Users/diavivel/Documents/Codigos Inves_DIAV/Mask Cober/1_Dia1_enero2020ndvi_maskCobe.tif")
plot(MascaraCober)

mas <- mask(resample(P, MascaraCober), MascaraCober, method= 'ngb')


#Reproyectada a 1 km, ya que estaba en 5 km y estan con vecinos cercanos
Prc_pro <- projectRaster(mas, km_Topografic)
plot(Prc_pro)


#writeRaster(Prc_pro, file="366Datosprecipitación2019_2020.tif")

#Utilizando 5 dias antes y 5 dias durantes dias antes

# 7 al 16 diciembre 2019
diaPrecipit_7_16DICna_true <- calc(mas[[6:15]], sum, na.rm=TRUE)
diaPrecipit_7_16DICna_true[diaPrecipit_7_16DICna_true < 0]<- NA
plot(diaPrecipit_7_16DICna_true)

#17 al 26 de diciembre 2019
diaPrecipit_17_26DIC_true <- calc(Prc_pro[[16:25]], sum, na.rm=TRUE)
diaPrecipit_17_26DIC_true[diaPrecipit_17_26DIC_true < 0]<- NA
plot(diaPrecipit_17_26DIC_true)

# 27 de dic  2019 al 6 enero 2020
diaPrecipit_27Dic_6Enena_true <- calc(Prc_pro[[26:36]], sum, na.rm=TRUE)
diaPrecipit_27Dic_6Enena_true[diaPrecipit_27Dic_6Enena_true < 0]<- NA
plot(diaPrecipit_27Dic_6Enena_true)

#7 al 16 enero 
diaPrecipit_7_16Enerotrue <- calc(Prc_pro[[37:45]], sum, na.rm=TRUE)
diaPrecipit_7_16Enerotrue[diaPrecipit_7_16Enerotrue < 0]<- NA
plot(diaPrecipit_7_16Enerotrue)

# 17 al 26 enero
diaPrecipit17_26Enero_na_true <- calc(Prc_pro[[46:55]], sum, na.rm=TRUE)
diaPrecipit17_26Enero_na_true[diaPrecipit17_26Enero_na_true  < 0]<- NA
plot(diaPrecipit17_26Enero_na_true)

#27 Enero al 6 febrero
diaPrecipit27Ene_6Feb_na_true <- calc(Prc_pro[[56:66]], sum, na.rm=TRUE)
diaPrecipit27Ene_6Feb_na_true[diaPrecipit27Ene_6Feb_na_true  < 0]<- NA
plot(diaPrecipit27Ene_6Feb_na_true)

#7 al 16 febrero
diaPrecipit7_16Feb_na_true <- calc(Prc_pro[[67:76]], sum, na.rm=TRUE)
diaPrecipit7_16Feb_na_true[diaPrecipit7_16Feb_na_true < 0]<- NA
plot(diaPrecipit7_16Feb_na_true)

#17 al 26 de febrero 
diaPrecipit17_26febrerona_true <- calc(Prc_pro[[77:86]], sum, na.rm=TRUE)
diaPrecipit17_26febrerona_true[diaPrecipit17_26febrerona_true < 0]<- NA
plot(diaPrecipit17_26febrerona_true)

#27 de febrero al 6 de marzo
diaPrecipit_27febrero_6Marzo_na_true <- calc(Prc_pro[[87:95]], sum, na.rm=TRUE)
diaPrecipit_27febrero_6Marzo_na_true[diaPrecipit_27febrero_6Marzo_na_true < 0]<- NA
plot(diaPrecipit_27febrero_6Marzo_na_true)

# 7 al 16 Marzo
diaPrecipit7_16Marzona_true <- calc(Prc_pro[[96:105]], sum, na.rm=TRUE)
diaPrecipit7_16Marzona_true[diaPrecipit7_16Marzona_true< 0]<- NA
plot(diaPrecipit7_16Marzona_true)

#17 al 26 de marzo
diaPrecipi17_26Marzo_na_true <- calc(Prc_pro[[106:115]], sum, na.rm=TRUE)
diaPrecipi17_26Marzo_na_true[diaPrecipi17_26Marzo_na_true< 0]<- NA
plot(diaPrecipi17_26Marzo_na_true)

#27 de marzo al 6 de abril 
diaPrecipit27Marzo_6abr_na_true <- calc(Prc_pro[[116:126]], sum, na.rm=TRUE)
diaPrecipit27Marzo_6abr_na_true[diaPrecipit27Marzo_6abr_na_true < 0]<- NA
plot(diaPrecipit27Marzo_6abr_na_true)

#7 al 16 abril 
diaPrecipit7_16abri_na_true <- calc(Prc_pro[[127:136]], sum, na.rm=TRUE)
diaPrecipit7_16abri_na_true[diaPrecipit7_16abri_na_true < 0]<- NA
plot(diaPrecipit7_16abri_na_true)

#17 al 26 abril  
diaPrecipit17_26Abril_na_true <- calc(Prc_pro[[137:146]], sum, na.rm=TRUE)
diaPrecipit17_26Abril_na_true[diaPrecipit17_26Abril_na_true < 0]<- NA
plot(diaPrecipit17_26Abril_na_true)

# 27 abril al 6 de Mayo 
diaPrecipit_27Abril_6mayo_na_true <- calc(Prc_pro[[147:156]], sum, na.rm=TRUE)
diaPrecipit_27Abril_6mayo_na_true[diaPrecipit_27Abril_6mayo_na_true  < 0]<- NA
plot(diaPrecipit_27Abril_6mayo_na_true)

# 7 AL 16 Mayo
diaPrecipit7_16mayona_true <- calc(Prc_pro[[157:166]], sum, na.rm=TRUE)
diaPrecipit7_16mayona_true[diaPrecipit7_16mayona_true < 0]<- NA
plot(diaPrecipit7_16mayona_true)

#17 al 26 Mayo 
diaPrecipit_17_26Mayona_true <- calc(Prc_pro[[167:176]], sum, na.rm=TRUE)
diaPrecipit_17_26Mayona_true[diaPrecipit_17_26Mayona_true < 0]<- NA
plot(diaPrecipit_17_26Mayona_true)

#27 de mayo al 6 de Junio
diaPrecipit27mayo_6Juniona_true <- calc(Prc_pro[[177:187]], sum, na.rm=TRUE)
diaPrecipit27mayo_6Juniona_true[diaPrecipit27mayo_6Juniona_true < 0]<- NA
plot(diaPrecipit27mayo_6Juniona_true)

#7 al 16 junio 
diaPrecipi7_16Junina_true <- calc(Prc_pro[[188:197]], sum, na.rm=TRUE)
diaPrecipi7_16Junina_true[diaPrecipi7_16Junina_true < 0]<- NA
plot(diaPrecipi7_16Junina_true)

#17 al 26 de junio
diaPrecipit_17_26juni_true <- calc(Prc_pro[[198:207]], sum, na.rm=TRUE)
diaPrecipit_17_26juni_true[diaPrecipit_17_26juni_true < 0]<- NA
plot(diaPrecipit_17_26juni_true)

# 27 junio al 6 julio
diaPrecipit27jun_6julioona_true <- calc(Prc_pro[[208:217]], sum, na.rm=TRUE)
diaPrecipit27jun_6julioona_true[diaPrecipit27jun_6julioona_true < 0]<- NA
plot(diaPrecipit27jun_6julioona_true)

#7 al 16 julio
diaPrecipit_7_16juliona_true <- calc(Prc_pro[[218:227]], sum, na.rm=TRUE)
diaPrecipit_7_16juliona_true [diaPrecipit_7_16juliona_true  < 0]<- NA
plot(diaPrecipit_7_16juliona_true)

#17 al 26 Julio
diaPrecipit17_26Juliorue <- calc(Prc_pro[[228:237]], sum, na.rm=TRUE)
diaPrecipit17_26Juliorue [diaPrecipit17_26Juliorue  < 0]<- NA
plot(diaPrecipit17_26Juliorue)

#27 julio al 6 de agosto 
diaPrecipit27julio_6agostona_true <- calc(Prc_pro[[238:248]], sum, na.rm=TRUE)
diaPrecipit27julio_6agostona_true [diaPrecipit27julio_6agostona_true  < 0]<- NA
plot(diaPrecipit27julio_6agostona_true)

#7 al 16 agosto
diaPrecipit_7_16agostotrue <- calc(Prc_pro[[249:258]], sum, na.rm=TRUE)
diaPrecipit_7_16agostotrue [diaPrecipit_7_16agostotrue  < 0]<- NA
plot(diaPrecipit_7_16agostotrue)

#17 al 26 agosto
diaPrecipit_17_26agosto__true <- calc(Prc_pro[[259:268]], sum, na.rm=TRUE)
diaPrecipit_17_26agosto__true [diaPrecipit_17_26agosto__true < 0]<- NA
plot(diaPrecipit_17_26agosto__true)

#27 agosto al 6 Septiembre
diaPrecipit_27agosto_6septina_true <- calc(Prc_pro[[269:279]], sum, na.rm=TRUE)
diaPrecipit_27agosto_6septina_true[diaPrecipit_27agosto_6septina_true  < 0]<- NA
plot(diaPrecipit_27agosto_6septina_true)

#7 al 16 de septiembre 
diaPrecipit7_67septi_true <- calc(Prc_pro[[280:289]], sum, na.rm=TRUE)
diaPrecipit7_67septi_true [diaPrecipit7_67septi_true  < 0]<- NA
plot(diaPrecipit7_67septi_true)

#17 al 26 de septiembre
diaPrecipit_17_26septi_1true <- calc(Prc_pro[[290:299]], sum, na.rm=TRUE)
diaPrecipit_17_26septi_1true[diaPrecipit_17_26septi_1true < 0]<- NA
plot(diaPrecipit_17_26septi_1true)

#27 Septiembre al 6 de octubre 
diaPrecipit27septiembre_6octuna_true <- calc(Prc_pro[[300:309]], sum, na.rm=TRUE)
diaPrecipit27septiembre_6octuna_true[diaPrecipit27septiembre_6octuna_true < 0]<- NA
plot(diaPrecipit27septiembre_6octuna_true)

#7 al 16 Octubre
diaPrecipit7_16Octubretrue <- calc(Prc_pro[[310:319]], sum, na.rm=TRUE)
diaPrecipit7_16Octubretrue[diaPrecipit7_16Octubretrue < 0]<- NA
plot(diaPrecipit7_16Octubretrue)

#17 al 26 de octubre
diaPrecipit17_26Octutrue <- calc(Prc_pro[[320:329]], sum, na.rm=TRUE)
diaPrecipit17_26Octutrue[diaPrecipit17_26Octutrue < 0]<- NA
plot(diaPrecipit17_26Octutrue)

#27 octubre al 6 de noviembre  
diaPrecipit27Octubre_6Novna_true <- calc(Prc_pro[[330:340]], sum, na.rm=TRUE)
diaPrecipit27Octubre_6Novna_true[diaPrecipit27Octubre_6Novna_true < 0]<- NA
plot(diaPrecipit27Octubre_6Novna_true)

#7 al 16  de noviembre 
diaPrecipit7_16Noviena_true <- calc(Prc_pro[[341:350]], sum, na.rm=TRUE)
diaPrecipit7_16Noviena_true[diaPrecipit7_16Noviena_true< 0]<- NA
plot(diaPrecipit7_16Noviena_true)

#17 al 26 de noviembre  
diaPrecipit_17_26Novtrue <- calc(Prc_pro[[351:360]], sum, na.rm=TRUE)
diaPrecipit_17_26Novtrue [diaPrecipit_17_26Novtrue < 0]<- NA
plot(diaPrecipit_17_26Novtrue)

# 27 Noviembre al 6 diciembre
diaPrecipit_27Nov_6dicna_true <- calc(Prc_pro[[361:370]], sum, na.rm=TRUE)
diaPrecipit_27Nov_6dicna_true[diaPrecipit_27Nov_6dicna_true< 0]<- NA
plot(diaPrecipit_27Nov_6dicna_true)
mapview(diaPrecipit_27Nov_6dicna_true)


#FAPAR
setwd("~/Codigos Inves_DIAV/7 al 16 dic precipitacion para fapar")
#Unificar archivos
s <- stack(list.files(pattern = ".tif"))
ex <- extent(-9.4, 4.4, 35.2, 43.9)
P <- stack(crop(s, ex))

#Variable Topografi
km_Topografic <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")
plot(km_Topografic)

#Cobertura con la mascra del dia 1 de NDVI
MascaraCober <- raster("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/36N dias de NDVI con mascara de cobertura/1_Dia1_enero2020ndvi_maskCobe.tif")
plot(MascaraCober)

mas <- mask(resample(P, MascaraCober), MascaraCober, method= 'ngb')


#Reproyectada a 1 km, ya que estaba en 5 km y estan con vecinos cercanos
Prc_pro <- projectRaster(mas, km_Topografic)
plot(Prc_pro)


# 7 al 16 dic
diaPrecipit_7_16diciemna_true <- calc(Prc_pro[[1:10]], sum, na.rm=TRUE)
diaPrecipit_7_16diciemna_true[diaPrecipit_7_16diciemna_true< 0]<- NA
plot(diaPrecipit_7_16diciemna_true)
mapview(diaPrecipit_7_16diciemna_true)




#Guardando como imagen
writeRaster(diaPrecipit_7_16DICna_true, file="1_AcumuladoDíaPrecipitacion_7_16DIC_2019.tif")
writeRaster(diaPrecipit_17_26DIC_true, file="2_AcumuladoDíaPrecipitacion_17_26DIC_2019.tif")
writeRaster(diaPrecipit_27Dic_6Enena_true, file="3_AcumuladoDíaPrecipitacion27Dic_6Enena.tif")
writeRaster(diaPrecipit_7_16Enerotrue, file="4_AcumuladoDíaPrecipitacion_7_16Eneroo.tif")
writeRaster(diaPrecipit17_26Enero_na_true, file="5_AcumuladoDíaPrecipitacion17_26Enero.tif")
writeRaster(diaPrecipit27Ene_6Feb_na_true, file="6_AcumuladoDíaPrecipitacion_27Ene_6Feb_.tif")
writeRaster(diaPrecipit7_16Feb_na_true, file="7_AcumuladoDíaPrecipitacion7_16Feb.tif")
writeRaster(diaPrecipit17_26febrerona_true, file="8_AcumuladoDíaPrecipitacion17_26febrero.tif")
writeRaster(diaPrecipit_27febrero_6Marzo_na_true, file="9_AcumuladoDíaPrecipitacion27febrero_6Marzo.tif")
writeRaster(diaPrecipit7_16Marzona_true, file="10_AcumuladoDíaPrecipitacion_7_16Marzo.tif")
writeRaster(diaPrecipi17_26Marzo_na_true, file="11_AcumuladoDíaPrecipitacion17_26Marzo.tif")
writeRaster(diaPrecipit27Marzo_6abr_na_true, file="12_AcumuladoDíaPrecipitacion27Marzo_6abr.tif")
writeRaster(diaPrecipit7_16abri_na_true, file="13_AcumuladoDíaPrecipitacion_7_16abri.tif")
writeRaster(diaPrecipit17_26Abril_na_true, file="14_AcumuladoDíaPrecipitacion_17_26Abril.tif")
writeRaster(diaPrecipit_27Abril_6mayo_na_true, file="15_AcumuladoDíaPrecipitacion27Abril_6mayo.tif")
writeRaster(diaPrecipit7_16mayona_true, file="16_AcumuladoDíaPrecipitacion_7_16mayo.tif")
writeRaster(diaPrecipit_17_26Mayona_true, file="17_AcumuladoDíaPrecipitacion17_26Mayo.tif")
writeRaster(diaPrecipit27mayo_6Juniona_true, file="18_AcumuladoDíaPrecipitacion_27mayo_6Junio.tif")
writeRaster(diaPrecipi7_16Junina_true, file="19_AcumuladoDíaPrecipitacion_7_16Junin.tif")
writeRaster(diaPrecipit_17_26juni_true, file="20_AcumuladoDíaPrecipitacion17_26juni.tif")
writeRaster(diaPrecipit27jun_6julioona_true, file="21_AcumuladoDíaPrecipitacion27jun_6julio.tif")
writeRaster(diaPrecipit_7_16juliona_true , file="22_AcumuladoDíaPrecipitacion__7_16juliona.tif")
writeRaster(diaPrecipit17_26Juliorue, file="23_AcumuladoDíaPrecipitacion_17_26Julio.tif")
writeRaster(diaPrecipit27julio_6agostona_true, file="24_AcumuladoPromedioDíaPrecipitacion27julio_6agosto.tif")
writeRaster(diaPrecipit_7_16agostotrue, file="25_AcumuladoDíaPrecipitacion_7_16agosto.tif")
writeRaster(diaPrecipit_17_26agosto__true, file="26_AcumuladoDíaPrecipitacion17_26agosto.tif")
writeRaster(diaPrecipit_27agosto_6septina_true , file="27_AcumuladoDíaPrecipitacion_27agosto_6septina.tif")
writeRaster(diaPrecipit7_67septi_true, file="28_AcumuladoDíaPrecipitacion7_67septi.tif")
writeRaster(diaPrecipit_17_26septi_1true, file="29_AcumuladoDíaPrecipitacion_17_26septi.tif")
writeRaster(diaPrecipit27septiembre_6octuna_true, file="30_AcumuladoDíaPrecipitacion27septiembre_6octuna.tif")
writeRaster(diaPrecipit7_16Octubretrue, file="31_AcumuladoDíaPrecipitacion7_16Octubre.tif")
writeRaster(diaPrecipit17_26Octutrue, file="32_AcumuladoDíaPrecipitacion17_26Octutrue.tif")
writeRaster(diaPrecipit27Octubre_6Novna_true, file="33_AcumuladoDíaPrecipitacion27Octubre_6Novna_true.tif")
writeRaster(diaPrecipit7_16Noviena_true, file="34_AcumuladoDíaPrecipitacion7_16Novie.tif")
writeRaster(diaPrecipit_17_26Novtrue, file="35_AcumuladoDíaPrecipitacion17_26Nov.tif")
writeRaster(diaPrecipit_27Nov_6dicna_true, file="36_AcumuladoDíaPrecipitacion27Nov_6dic2020.tif")

#FAPAR
writeRaster(diaPrecipit_7_16diciemna_true, file="36_1AcumuladoDíaPrecipitacion7_16diciembre2020.tif")
