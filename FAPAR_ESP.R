#FAPAR
# Cargar librería raster 
library(raster)
library(rgdal)
library(maps)
library(dichromat)
library(spatialEco)
library(mapview)
library(rasterVis)
library(RColorBrewer)

# ubicación del directorio de trabajo
setwd("D:/Vegetación/Dato de 36 dias de FAPAR 2020")


li <- list.files("D:/Vegetación/Dato de 36 dias de FAPAR 2020", pattern = ".tiff$", full.names = TRUE)
st <- stack(li, quick=TRUE)
e <- extent(st)

# Grupos Topograficos
#NAvalue(Grupo1) <- 2
#plot(Grupo1)
#as.factor(Grupo1) <- FALSE

# Cobertura
cobertura4grupos <- shapefile("D:/Cobertura vectorial de 5 GB/Cortes de ESP/Disolve 4 grupos cobertura correcion geo.shp")
cobertura_4grupos_ESP <- spTransform(cobertura4grupos, CRS(projection("+proj=longlat +ellps=WGS84 +no_defs ")))
projection(cobertura_4grupos_ESP)

Km_Topografic <- raster("D:/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

# No la he corrido hace falta corregir a FAPAR
# Unificar archivos
#s <- stack(list.files(pattern = ".tiff"))
#plot(extent(s))

# Extención del area de investigación
#ex <- extent(-9.4, 4.4, 35.2, 43.9)

# Stack de la extención y los archivos "tiff"
ESP_FAPAR <- stack(crop(st, e))
plot(ESP_FAPAR)

#Reproyectar a 1km (Error in rgdal::getRasterData(con, offset = offs, region.dim = reg, band = object@data@band) : 
#Failure during raster IO
#Además: Warning message:
# In projectRaster(ESP_FAPAR, Km_Topografic) :
# input and ouput crs are the same)[[1]]
Prcj_FAPAR <- projectRaster(ESP_FAPAR [[1]], Km_Topografic)

MascaraFAPAR <- mask(Prcj_FAPAR, cobertura_4grupos_ESP)
plot(MascaraFAPAR)




#DIA 1 de enero 
dia1eneroNDVI_2020 <-Prcj_NDVI[[1]]
plot(dia1eneroNDVI_2020 )
writeRaster(dia1eneroNDVI_2020, file="Dia1_enero2020ndvi_maskCobe.tif")

# dia 11 de enero
dia11eneroNDVI_2020 <-Prcj_NDVI[[2]]
plot(dia11eneroNDVI_2020 )
writeRaster(dia11eneroNDVI_2020, file="Dia11_enero2020ndvi_maskCobe.tif")

#dia 21 de enero 
dia21eneroNDVI_2020 <-Prcj_NDVI[[3]]
plot(dia21eneroNDVI_2020 )
writeRaster(dia21eneroNDVI_2020, file="Dia21_enero2020ndvi_maskCobe.tif")

# dia 1 de febrero
dia1febreroNDVI_2020 <-Prcj_NDVI[[4]]
plot(dia1febreroNDVI_2020)
writeRaster(dia1febreroNDVI_2020, file="Dia1_febrero2020ndvi_maskCobe.tif")

# dia 11 de febrero 
dia11ebreroNDVI_2020 <-Prcj_NDVI[[5]]
plot(dia11ebreroNDVI_2020 )
writeRaster(dia11ebreroNDVI_2020, file="Dia11_febrero2020ndvi_maskCobe.tif")

# dia 21 de febrero
dia21ebreroNDVI_2020 <-Prcj_NDVI[[6]]
plot(dia21ebreroNDVI_2020 )
writeRaster(dia21ebreroNDVI_2020, file="Dia21_febrero2020ndvi_maskCobe.tif")

# dia 1 de Marzo
dia1marzoNDVI_2020 <-Prcj_NDVI[[7]]
plot(dia1marzoNDVI_2020)
writeRaster(dia1marzoNDVI_2020, file="Dia1_marzo2020ndvi_maskCobe.tif")

# dia 11 de Marzo
dia11marzoNDVI_2020 <-Prcj_NDVI[[8]]
plot(dia11marzoNDVI_2020)
writeRaster(dia11marzoNDVI_2020, file="Dia11_marzo2020ndvi_maskCobe.tif")

# dia 21 de Marzo
dia21marzoNDVI_2020 <-Prcj_NDVI[[9]]
plot(dia21marzoNDVI_2020)
writeRaster(dia21marzoNDVI_2020, file="Dia21_marzo2020ndvi_maskCobe.tif")

# dia 1 de Abril
dia1abrilNDVI_2020 <-Prcj_NDVI[[10]]
plot(dia1abrilNDVI_2020)
writeRaster(dia1abrilNDVI_2020, file="Dia1_abril2020ndvi_maskCobe.tif")

# dia 11 de Abril
dia11abrilNDVI_2020 <-Prcj_NDVI[[11]]
plot(dia11abrilNDVI_2020)
writeRaster(dia11abrilNDVI_2020, file="Dia11_abril2020ndvi_maskCobe.tif")

# dia 21 de Abril
dia21abrilNDVI_2020 <-Prcj_NDVI[[12]]
plot(dia21abrilNDVI_2020)
writeRaster(dia21abrilNDVI_2020, file="Dia21_abril2020ndvi_maskCobe.tif")

# dia 1 Mayo
dia1mayoNDVI_2020 <-Prcj_NDVI[[13]]
plot(dia1mayoNDVI_2020)
writeRaster(dia1mayoNDVI_2020, file="Dia1_Mayo2020ndvi_maskCobe.tif")

# dia 11 Mayo
dia11mayoNDVI_2020 <-Prcj_NDVI[[14]]
plot(dia11mayoNDVI_2020)
writeRaster(dia11mayoNDVI_2020, file="Dia11_Mayo2020ndvi_maskCobe.tif")

# dia 21 Mayo
dia21mayoNDVI_2020 <-Prcj_NDVI[[15]]
plot(dia21mayoNDVI_2020)
writeRaster(dia21mayoNDVI_2020, file="Dia21_Mayo2020ndvi_maskCobe.tif")

# dia 1 Junio
dia1junioNDVI_2020 <-Prcj_NDVI[[16]]
plot(dia1junioNDVI_2020)
writeRaster(dia1junioNDVI_2020, file="Dia1_junio2020ndvi_maskCobe.tif")

# dia 11 Junio
dia11junioNDVI_2020 <-Prcj_NDVI[[17]]
plot(dia11junioNDVI_2020)
writeRaster(dia11junioNDVI_2020, file="Dia11_junio2020ndvi_maskCobe.tif")

# dia 21 Junio
dia21junioNDVI_2020 <-Prcj_NDVI[[18]]
plot(dia21junioNDVI_2020)
writeRaster(dia21junioNDVI_2020, file="Dia21_junio2020ndvi_maskCobe.tif")

# dia 1 Julio
dia1julioNDVI_2020 <-Prcj_NDVI[[19]]
plot(dia1julioNDVI_2020)
writeRaster(dia1julioNDVI_2020, file="Dia1_julio2020ndvi_maskCobe.tif")

# dia 11 Julio
dia11julioNDVI_2020 <-Prcj_NDVI[[20]]
plot(dia11julioNDVI_2020)
writeRaster(dia11julioNDVI_2020, file="Dia11_julio2020ndvi_maskCobe.tif")

# dia 21 Julio
dia21julioNDVI_2020 <-Prcj_NDVI[[21]]
plot(dia21julioNDVI_2020)
writeRaster(dia21julioNDVI_2020, file="Dia21_julio2020ndvi_maskCobe.tif")

# dia 1 Agosto
dia1agostoNDVI_2020 <-Prcj_NDVI[[22]]
plot(dia1agostoNDVI_2020)
writeRaster(dia1agostoNDVI_2020, file="Dia1_agosto2020ndvi_maskCobe.tif")

# dia 11 Agosto
dia11agostoNDVI_2020 <-Prcj_NDVI[[23]]
plot(dia11agostoNDVI_2020)
writeRaster(dia11agostoNDVI_2020, file="Dia11_agosto2020ndvi_maskCobe.tif")

# dia 21 Agosto
dia21agostoNDVI_2020 <-Prcj_NDVI[[24]]
plot(dia21agostoNDVI_2020)
writeRaster(dia21agostoNDVI_2020, file="Dia21_agosto2020ndvi_maskCobe.tif")

# dia 1 Septiembre
dia1septiembreNDVI_2020 <-Prcj_NDVI[[25]]
plot(dia1septiembreNDVI_2020)
writeRaster(dia1septiembreNDVI_2020, file="Dia1_septiembre2020ndvi_maskCobe.tif")


# dia 11 Septiembre
dia11septiembreNDVI_2020 <-Prcj_NDVI[[26]]
plot(dia11septiembreNDVI_2020)
writeRaster(dia11septiembreNDVI_2020, file="Dia11_septiembre2020ndvi_maskCobe.tif")


# dia 21 Septiembre
dia21septiembreNDVI_2020 <-Prcj_NDVI[[27]]
plot(dia21septiembreNDVI_2020)
writeRaster(dia21septiembreNDVI_2020, file="Dia21_septiembre2020ndvi_maskCobe.tif")


# dia 1 Octubre
dia1octubreNDVI_2020 <-Prcj_NDVI[[28]]
plot(dia1octubreNDVI_2020)
writeRaster(dia1octubreNDVI_2020, file="Dia1_octubre2020ndvi_maskCobe.tif")

# dia 11 Octubre
dia11octubreNDVI_2020 <-Prcj_NDVI[[29]]
plot(dia11octubreNDVI_2020)
writeRaster(dia11octubreNDVI_2020, file="Dia11_octubre2020ndvi_maskCobe.tif")

# dia 21 Octubre
dia21octubreNDVI_2020 <-Prcj_NDVI[[30]]
plot(dia21octubreNDVI_2020)
writeRaster(dia21octubreNDVI_2020, file="Dia21_octubre2020ndvi_maskCobe.tif")

# dia 1 Noviembre
dia1noviembreNDVI_2020 <-Prcj_NDVI[[31]]
plot(dia1noviembreNDVI_2020)
writeRaster(dia1noviembreNDVI_2020, file="Dia1_Noviembre2020ndvi_maskCobe.tif")

# dia 11 Noviembre
dia11noviembreNDVI_2020 <-Prcj_NDVI[[32]]
plot(dia11noviembreNDVI_2020)
writeRaster(dia11noviembreNDVI_2020, file="Dia11_noviembre2020ndvi_maskCobe.tif")

# dia 21 Noviembre
dia21noviembreNDVI_2020 <-Prcj_NDVI[[33]]
plot(dia21noviembreNDVI_2020)
writeRaster(dia21noviembreNDVI_2020, file="Dia21_noviembre2020ndvi_maskCobe.tif")

# dia 1 Diciembre
dia1diciembreNDVI_2020 <-Prcj_NDVI[[34]]
plot(dia1diciembreNDVI_2020)
writeRaster(dia1diciembreNDVI_2020, file="Dia1_diciembre2020ndvi_maskCobe.tif")

# dia 11 Diciembre
dia11diciembreNDVI_2020 <-Prcj_NDVI[[35]]
plot(dia11diciembreNDVI_2020)
writeRaster(dia11diciembreNDVI_2020, file="Dia11_diciembre2020ndvi_maskCobe.tif")

# dia 21 Diciembre
dia21diciembreNDVI_2020 <-Prcj_NDVI[[36]]
plot(dia21diciembreNDVI_2020)
writeRaster(dia21diciembreNDVI_2020, file="Dia21_diciembre2020ndvi_maskCobe.tif")
