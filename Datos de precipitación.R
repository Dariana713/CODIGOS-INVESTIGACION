#Precipitacion diaria (mm / día)

#para hacer promedios de 10 dias antes del dia de NDVI que abarca 
#los dias promedios de humedad 


#Cargar librería raster 
library(raster)
library(rgdal)



#Ubicación Precipitación
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/Datos Precipitación")
# Limites
#limn <- getData('GADM', country='ESP', level=2)
#plot(limn)

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


#writeRaster(Prc_pro, file="366Datosprecipitación2019_2020.tif")


# 12 al 21 diciembre 2019
diaPrecipit_12_21DICna_true <- calc(mas[[1:10]], sum, na.rm=TRUE)
diaPrecipit_12_21DICna_true[diaPrecipit_12_21DICna_true < 0]<- NA
plot(diaPrecipit_12_21DICna_true)

#22 dic 2019 al 1 de enero 2020
diaPrecipit_22DIC_1Enena_true <- calc(Prc_pro[[11:21]], sum, na.rm=TRUE)
diaPrecipit_22DIC_1Enena_true[diaPrecipit_22DIC_1Enena_true < 0]<- NA
plot(diaPrecipit_22DIC_1Enena_true)

# 2 al 11 de enero
diaPrecipit_2_11Enena_true <- calc(Prc_pro[[22:31]], sum, na.rm=TRUE)
diaPrecipit_2_11Enena_true[diaPrecipit_2_11Enena_true < 0]<- NA
plot(diaPrecipit_2_11Enena_true)

#12 al 21 enero
diaPrecipit_12_21Enerotrue <- calc(Prc_pro[[32:41]], sum, na.rm=TRUE)
diaPrecipit_12_21Enerotrue[diaPrecipit_12_21Enerotrue < 0]<- NA
plot(diaPrecipit_12_21Enerotrue)

#22 enero al 1 febrero
diaPrecipit22enero_1Feb_na_true <- calc(Prc_pro[[42:52]], sum, na.rm=TRUE)
diaPrecipit22enero_1Feb_na_true[diaPrecipit22enero_1Feb_na_true  < 0]<- NA
plot(diaPrecipit22enero_1Feb_na_true)

#2 al 11 febrero
diaPrecipit2_11Feb_na_true <- calc(Prc_pro[[53:62]], sum, na.rm=TRUE)
diaPrecipit2_11Feb_na_true[diaPrecipit2_11Feb_na_true < 0]<- NA
plot(diaPrecipit2_11Feb_na_true)

#12 al 21 febrero
diaPrecipit12_21Feb_na_true <- calc(Prc_pro[[63:72]], sum, na.rm=TRUE)
diaPrecipit12_21Feb_na_true[diaPrecipit12_21Feb_na_true < 0]<- NA
plot(diaPrecipit12_21Feb_na_true)

#22 de febrero al 1 de marzo (solo 8 dias, febrero tine 29 dias) 
diaPrecipit22febrero_1Marzo_na_true <- calc(Prc_pro[[73:81]], sum, na.rm=TRUE)
diaPrecipit22febrero_1Marzo_na_true[diaPrecipit22febrero_1Marzo_na_true < 0]<- NA
plot(diaPrecipit22febrero_1Marzo_na_true)

#2 al 11 de marzo
diaPrecipit_2_11Marzo_na_true <- calc(Prc_pro[[82:91]], sum, na.rm=TRUE)
diaPrecipit_2_11Marzo_na_true[diaPrecipit_2_11Marzo_na_true < 0]<- NA
plot(diaPrecipit_2_11Marzo_na_true)

#12 al 21 de marzo
diaPrecipit12_21Marzona_true <- calc(Prc_pro[[92:101]], sum, na.rm=TRUE)
diaPrecipit12_21Marzona_true[diaPrecipit12_21Marzona_true< 0]<- NA
plot(diaPrecipit12_21Marzona_true)

#22 de Marzo al 1 de abril 
diaPrecipit22mar_1abr_na_true <- calc(Prc_pro[[102:112]], sum, na.rm=TRUE)
diaPrecipit22mar_1abr_na_true[diaPrecipit22mar_1abr_na_true< 0]<- NA
plot(diaPrecipit22mar_1abr_na_true)

#2 al 11 de abril 
diaPrecipit_2_11abr_na_true <- calc(Prc_pro[[113:122]], sum, na.rm=TRUE)
diaPrecipit_2_11abr_na_true[diaPrecipit_2_11abr_na_true < 0]<- NA
plot(diaPrecipit_2_11abr_na_true)

#12 al 21 de abril 
diaPrecipit12_21abri_na_true <- calc(Prc_pro[[123:132]], sum, na.rm=TRUE)
diaPrecipit12_21abri_na_true[diaPrecipit12_21abri_na_true < 0]<- NA
plot(diaPrecipit12_21abri_na_true)

#22 de abril al 1 de mayo 
diaPrecipit_22Abri_1mayo_na_true <- calc(Prc_pro[[133:142]], sum, na.rm=TRUE)
diaPrecipit_22Abri_1mayo_na_true[diaPrecipit_22Abri_1mayo_na_true < 0]<- NA
plot(diaPrecipit_22Abri_1mayo_na_true)

#2 al 11 de Mayo 
diaPrecipit_2_11mayo_na_true <- calc(Prc_pro[[143:152]], sum, na.rm=TRUE)
diaPrecipit_2_11mayo_na_true [diaPrecipit_2_11mayo_na_true  < 0]<- NA
plot(diaPrecipit_2_11mayo_na_true)

#12 al 21 de mayo
diaPrecipit_12_21mayona_true <- calc(Prc_pro[[153:162]], sum, na.rm=TRUE)
diaPrecipit_12_21mayona_true[diaPrecipit_12_21mayona_true < 0]<- NA
plot(diaPrecipit_12_21mayona_true)

#22 de mayo al 1 de junio 
diaPrecipit_22mayo_1Juniona_true <- calc(Prc_pro[[163:173]], sum, na.rm=TRUE)
diaPrecipit_22mayo_1Juniona_true[diaPrecipit_22mayo_1Juniona_true < 0]<- NA
plot(diaPrecipit_22mayo_1Juniona_true)

#2 al 11 de junio
diaPrecipit2_11Juniona_true <- calc(Prc_pro[[174:183]], sum, na.rm=TRUE)
diaPrecipit2_11Juniona_true[diaPrecipit2_11Juniona_true < 0]<- NA
plot(diaPrecipit2_11Juniona_true)

#12 _21 de junio 
diaPrecipit12_21Junina_true <- calc(Prc_pro[[184:193]], sum, na.rm=TRUE)
diaPrecipit12_21Junina_true[diaPrecipit12_21Junina_true < 0]<- NA
plot(diaPrecipit12_21Junina_true)

#22 de junio al 1 de Julio
diaPrecipit_22juni_1julioona_true <- calc(Prc_pro[[194:203]], sum, na.rm=TRUE)
diaPrecipit_22juni_1julioona_true[diaPrecipit_22juni_1julioona_true < 0]<- NA
plot(diaPrecipit_22juni_1julioona_true)

#2 al 11 de julio
diaPrecipit_2_11julioona_true <- calc(Prc_pro[[204:213]], sum, na.rm=TRUE)
diaPrecipit_2_11julioona_true[diaPrecipit_2_11julioona_true < 0]<- NA
plot(diaPrecipit_2_12julioona_true)

#12 al 21 de julio
diaPrecipit_12_21juliona_true <- calc(Prc_pro[[214:223]], sum, na.rm=TRUE)
diaPrecipit_12_21juliona_true [diaPrecipit_12_21juliona_true  < 0]<- NA
plot(diaPrecipit_12_21juliona_true)

#22 de julio al 1 de agosto 
diaPrecipit22Julio_1Agotrue <- calc(Prc_pro[[224:234]], sum, na.rm=TRUE)
diaPrecipit22Julio_1Agotrue [diaPrecipit22Julio_1Agotrue  < 0]<- NA
plot(diaPrecipit22Julio_1Agotrue)

#2 al 11 de agosto 
diaPrecipit2_11agostona_true <- calc(Prc_pro[[235:244]], sum, na.rm=TRUE)
diaPrecipit2_11agostona_true [diaPrecipit2_11agostona_true  < 0]<- NA
plot(diaPrecipit2_11agostona_true)

#12 al 21 de agosto
diaPrecipit_12_21agostotrue <- calc(Prc_pro[[245:254]], sum, na.rm=TRUE)
diaPrecipit_12_21agostotrue [diaPrecipit_12_21agostotrue  < 0]<- NA
plot(diaPrecipit_12_21agostotrue)

#22 de agosto al 1 de septiembre 
diaPrecipit_22agosto_1septina_true <- calc(Prc_pro[[255:265]], sum, na.rm=TRUE)
diaPrecipit_22agosto_1septina_true [diaPrecipit_22agosto_1septina_true  < 0]<- NA
plot(diaPrecipit_22agosto_1septina_true)

#2 11 de septiembre 
diaPrecipit_2_11septina_true <- calc(Prc_pro[[266:275]], sum, na.rm=TRUE)
diaPrecipit_2_11septina_true [diaPrecipit_2_11septina_true  < 0]<- NA
plot(diaPrecipit_2_11septina_true)

#12 al 21 de septiembre 
diaPrecipit12_21septi_true <- calc(Prc_pro[[276:285]], sum, na.rm=TRUE)
diaPrecipit12_21septi_true [diaPrecipit12_21septi_true  < 0]<- NA
plot(diaPrecipit12_21septi_true)

#22 al septiembre al 1 de octubre 
diaPrecipit_22septi_1octuna_true <- calc(Prc_pro[[286:295]], sum, na.rm=TRUE)
diaPrecipit_22septi_1octuna_true[diaPrecipit_22septi_1octuna_true < 0]<- NA
plot(diaPrecipit_22septi_1octuna_true)

#2 al 11 de octubre 
diaPrecipit_2_11octuna_true <- calc(Prc_pro[[296:305]], sum, na.rm=TRUE)
diaPrecipit_2_11octuna_true[diaPrecipit_2_11octuna_true < 0]<- NA
plot(diaPrecipit_2_11octuna_true)

#12 al 21 de octubre
diaPrecipit12_21Octubretrue <- calc(Prc_pro[[306:315]], sum, na.rm=TRUE)
diaPrecipit12_21Octubretrue[diaPrecipit12_21Octubretrue < 0]<- NA
plot(diaPrecipit12_21Octubretrue)

#22 de octubre al 1 de noviembre 
diaPrecipit22Octu_1Novna_true <- calc(Prc_pro[[316:326]], sum, na.rm=TRUE)
diaPrecipit22Octu_1Novna_true[diaPrecipit22Octu_1Novna_true < 0]<- NA
plot(diaPrecipit22Octu_1Novna_true)

#2 al 11de noviembre  
diaPrecipit2_11Novna_true <- calc(Prc_pro[[327:336]], sum, na.rm=TRUE)
diaPrecipit2_11Novna_true[diaPrecipit2_11Novna_true < 0]<- NA
plot(diaPrecipit2_11Novna_true)

#12 al 21 de noviembre 
diaPrecipit_12_21Noviena_true <- calc(Prc_pro[[337:346]], sum, na.rm=TRUE)
diaPrecipit_12_21Noviena_true[diaPrecipit_12_21Noviena_true< 0]<- NA
plot(diaPrecipit_12_21Noviena_true)

#22 noviembre al 1 dic 
diaPrecipit_22Nov_1dicna_true <- calc(Prc_pro[[347:356]], sum, na.rm=TRUE)
diaPrecipit_22Nov_1dicna_true[diaPrecipit_22Nov_1dicna_true< 0]<- NA
plot(diaPrecipit_22Nov_1dicna_true)

# 2 al 11 dic
diaPrecipit_12_21dicna_true <- calc(Prc_pro[[357:366]], sum, na.rm=TRUE)
diaPrecipit_12_21dicna_true[diaPrecipit_12_21dicna_true< 0]<- NA
plot(diaPrecipit_12_21dicna_true)
mapview(diaPrecipit_12_21dicna_true)




#Guardando como imagen
writeRaster(diaPrecipit_12_21DICna_true, file="1_AcumuladoDíaPrecipitacion_12_21diceimbre2019.tif")
writeRaster(diaPrecipit_22DIC_1Enena_true, file="2_AcumuladoDíaPrecipitacion_22diceimbre2019_1Ene_true_11.tif")
writeRaster(diaPrecipit_2_11Enena_true, file="3_AcumuladoDíaPrecipitacion2_11enero.tif")
writeRaster(diaPrecipit_12_21Enerotrue, file="4_AcumuladoDíaPrecipitacion_12_21enero.tif")
writeRaster(diaPrecipit22enero_1Feb_na_true, file="5_AcumuladoDíaPrecipitacion22enero1febrero.tif")
writeRaster(diaPrecipit2_11Feb_na_true, file="6_AcumuladoDíaPrecipitacion_2_11febrero.tif")
writeRaster(diaPrecipit12_21Feb_na_true, file="7_AcumuladoDíaPrecipitacion12_21febrero.tif")
writeRaster(diaPrecipit22febrero_1Marzo_na_true, file="8_AcumuladoDíaPrecipitacion_22febrero1marzo.tif")
writeRaster(diaPrecipit_2_11Marzo_na_true, file="9_AcumuladoDíaPrecipitacion_2_11marzo.tif")
writeRaster(diaPrecipit12_21Marzona_true, file="10_AcumuladoDíaPrecipitacion_12_21marzo.tif")
writeRaster(diaPrecipit22mar_1abr_na_true, file="11_AcumuladoDíaPrecipitacion22marzo1abril.tif")
writeRaster(diaPrecipit_2_11abr_na_true, file="12_AcumuladoDíaPrecipitacion_2_11abril.tif")
writeRaster(diaPrecipit12_21abri_na_true, file="13_AcumuladoDíaPrecipitacion_12_21abril.tif")
writeRaster(diaPrecipit_22Abri_1mayo_na_true, file="14_AcumuladoDíaPrecipitacion_22abril_1mayo.tif")
writeRaster(diaPrecipit_2_11mayo_na_true, file="15_AcumuladoDíaPrecipitacion_2_11mayo.tif")
writeRaster(diaPrecipit_12_21mayona_true, file="16_AcumuladoDíaPrecipitacion_12_21mayo.tif")
writeRaster(diaPrecipit_22mayo_1Juniona_true, file="17_AcumuladoDíaPrecipitacion_22mayo_1junio.tif")
writeRaster(diaPrecipit2_11Juniona_true, file="18_AcumuladoDíaPrecipitacion_2_11junio.tif")
writeRaster(diaPrecipit12_21Junina_true, file="19_AcumuladoDíaPrecipitacion_12_21junio.tif")
writeRaster(diaPrecipit_22juni_1julioona_true, file="20_AcumuladoDíaPrecipitacion_22junio_1julio.tif")
writeRaster(diaPrecipit_2_11julioona_true, file="21_AcumuladoDíaPrecipitacion_2_11julio.tif")
writeRaster(diaPrecipit_12_21juliona_true, file="22_AcumuladoDíaPrecipitacion_12_21julio.tif")
writeRaster(diaPrecipit22Julio_1Agotrue, file="23_AcumuladoDíaPrecipitacion_22julio1agosto.tif")
writeRaster(diaPrecipit2_11agostona_true, file="24_AcumuladoPromedioDíaPrecipitacion_2_11agosto.tif")
writeRaster(diaPrecipit_12_21agostotrue, file="25_AcumuladoDíaPrecipitacion_12_21agosto.tif")
writeRaster(diaPrecipit_22agosto_1septina_true, file="26_AcumuladoDíaPrecipitacion_22_agosto_1septi.tif")
writeRaster(diaPrecipit_2_11septina_true, file="27_AcumuladoDíaPrecipitacion_2_11septiembre.tif")
writeRaster(diaPrecipit12_21septi_true, file="28_AcumuladoDíaPrecipitacion12_21septiembre.tif")
writeRaster(diaPrecipit_22septi_1octuna_true, file="29_AcumuladoDíaPrecipitacion_22septiembre_1octibre.tif")
writeRaster(diaPrecipit_2_11octuna_true, file="30_AcumuladoDíaPrecipitacion_2_11octubre.tif")
writeRaster(diaPrecipit12_21Octubretrue, file="31_AcumuladoDíaPrecipitacion_12_21octubre.tif")
writeRaster(diaPrecipit22Octu_1Novna_true, file="32_AcumuladoDíaPrecipitacion_22octubre_1noviembre.tif")
writeRaster(diaPrecipit2_11Novna_true, file="33_AcumuladoDíaPrecipitacion_2_11noviembre.tif")
writeRaster(diaPrecipit_12_21Noviena_true, file="34_AcumuladoDíaPrecipitacion12_21noviembre.tif")
writeRaster(diaPrecipit_22Nov_1dicna_true, file="35_AcumuladoDíaPrecipitacion_22noviembre_1diciembre.tif")
writeRaster(diaPrecipit_12_21dicna_true, file="36_AcumuladoDíaPrecipitacion2_11diciembre2020.tif")






