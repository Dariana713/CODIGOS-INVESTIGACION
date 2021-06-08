# Cargar librerias 
library(raster)
library(RStoolbox)
library(FactoInvestigate)
library(FactoMineR)
library(factoextra)
library(rasterVis)

#carpeta de trabajo de Geomorfometría  
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/3 atributos")

#Unificar archivos 
list.files(pattern = ".tif")
Atributos <- stack(list.files(pattern = ".tif"), native=TRUE)
plot(Atributos)
limn <- getData('GADM', country='ESP', level=2)
Atributos_proj <- mask(Atributos,limn)
plot(Atributos_proj)

## Se estandariza el los atributos topograficos y se realiza el PCA

#PCA. spca me dice que si o no puedo estandarizar (https://www.odiolaestadistica.com/estadistica-python/estandarizacion/), en este caso si se entandarizo  para reducir las dimensiones de los valores. Hay que escalar los datos par centrar las medias
rpc <- rasterPCA(Atributos, spca=TRUE)

## Model parameters, con cada uno de los componetes y sus varianzas 
summary(rpc$model)
plot(rpc$model)

#loading es para intepretar las variables relacionadas con los componentes 
loadings(rpc$model)
plot(rpc$model)

#Data frame de los atributos 
dfTopo <- na.omit(as.data.frame(Atributos, xy=TRUE))
write.csv(dfTopo, file='tablePCAAtributosTopogr.csv')


#Esto es para?    La escala?, hacerlo con mas datos, intentar con 1000      
sr_1000 <- sampleRandom(Atributos, 1000) #hay un error a corregir

res = PCA(sr_1000)

Investigate(res)


# Kmeans 

image <- rpc$map

#Extraigo los valores
v <- getValues(image)
#Se eliminan los "na"
i <- which(!is.na(v))
#Se valoran los "na"
v <- na.omit(v)

#Generar el Kmeans, los grupos de terrenos probar con 2 grupos (hacer una diapositiva) ¿CUANTAS UNIDADES DE TRABAJO ES MAS RAZONABLE QUE PODAMOS DISTINGUIR?
E <- kmeans(v, 4, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)
mapview(kmeans_raster)
writeRaster(kmeans_raster, file="kmeans_3gruposTopograficos_bueno.tif")





#INDIVIDUELAES

#Se realiza la cargar el DEM
dem <- raster("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/3 atributos/DEM.tif")

#Se realiza la cargar el slope
slope <- raster( "~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/3 atributos/Slope.tif")

#Se realiza la cargar el aspect
aspect <- raster("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/Aspect/Aspect.tif")

#Se realiza la cargar el insolación directa
direct_insolat <- raster( "~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/4 ATRIBUTOS TOPOGRAFICOS/3 atributos/Direct Insolation.tif")


#Proyectar 
DEM_Proj <- mask(dem,limn)
plot(DEM_Proj)

# SSM Enero promedio

SSM_media_enero <- stack(list.files("C:/Users/Usuario/Documents/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Humedad/SSM_Bir  2020/1_Enero_SSM_Bir_2020/Imagenes correctas", full.names = TRUE))
plot(SSM_media_enero)
Ajuste_SSM_ENERO <- resample(SSM_media_enero, dem, method='ngb')


#Mediana de los 3 dias de enero SSM
medianaSSMenero <- calc(Ajuste_SSM_ENERO, median, na.rm=TRUE)
writeRaster(medianaSSMenero, file="medianaSSMenero.tif")
#Humedad proyectada
medianSSM <- mask(medianaSSMenero,limn)
ssm <- projectRaster(medianSSM,DEM_Proj)

## los raster tiene diferente extensión !!!
#Consulta por que no se pueden correlacionar ????
#Raster correlation (s es el tamaño de la ventana móvil para la correlación, x=topografico; y=SSM)
correlaciónSSM_Topoenero <-rasterCorrelation(dem, medianaSSMenero,  s = 9, type = "pearson")
#Eliminar los infinitos
correlaciónSSM_Topoenero[!is.finite(correlaciónSSM_Topoenero)] <- NA
  
plot(values(dem), values(medianaSSMenero))
plot(correlaciónSSM_Topoenero)
mapview(correlaciónSSM_Topoenero)

df <- na.omit(as.data.frame(stack(dem, ssm)))


