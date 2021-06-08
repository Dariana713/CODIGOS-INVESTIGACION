# Cargar librerias 
library(raster)
library(mapview)
library(RStoolbox)
library(FactoInvestigate)
library(FactoMineR)
library(factoextra)
library(rasterVis)


#carpeta de trabajo de Geomorfometría  
setwd("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/Prueba_19_02_21/Variables de SAGA GIS")


#Unificar archivos "sgrd", en un solo stack, que se llamará top
list.files(pattern = ".sgrd")
top <- stack(list.files(pattern = ".sgrd"), native=TRUE)
plot(top)


#Se realiza la cargar el DEM
dem <- raster("~/Análisis de Tesis en Rstudio y SAGA GIS/Variables/Georfometria R_SAGA GIS/Prueba_19_02_21/DEM.tif")
plot(dem)
#cambio de colores 


#Se unifica en un solo stack, el "top y dem",  (solo correr una vez para no generar doble variable).
top1 <- stack(top, dem)
plot(top1)

## Se estandariza el top1

#PCA. spca me dice que si o no puedo estandarizar (https://www.odiolaestadistica.com/estadistica-python/estandarizacion/), en este caso si se entandarizo  para reducir las dimensiones de los valores. Hay que escalar los datos par centrar las medias
rpc <- rasterPCA(top1, spca=TRUE)


## Model parameters, con cada uno de los componetes y sus varianzas 
summary(rpc$model)
plot(rpc$model)


#loading es para intepretar las variables relacionadas con los componentes 
loadings(rpc$model)
plot(rpc$model)

#Cambiando 
top1_df <- na.omit(as.data.frame(top1))


#Esto es para?    La escala?, hacerlo con mas datos, intentar con 1000
#Función de Sample Random Tome una muestra aleatoria de los valores de celda 
#de un objeto Raster * (sin reemplazo)

sr_1000 <- sampleRandom(top1, 1000)


res = PCA(sr_1000)

Investigate(res)


# eSTO ES ADICIONAL RGB, para ver las tres bandas color verdadero, ver la interacción de las variables)
ggRGB(rpc$map,1,2,3, stretch="lin", q=0)


# es para mostra los PRIMERO componentes DEL PCA 
if(require(gridExtra)){
  plots <- lapply(1:7, function(x) ggR(rpc$map, x, geom_raster = TRUE))
  grid.arrange(plots[[1]],plots[[2]], plots[[3]],plots[[4]], plots[[5]], plots[[6]], plots[[7]],  ncol=2)
}

# Kmeans 

#cargar librerias 
library("raster")  
library("cluster")
library("randomForest")

#
image <- rpc$map
#image <- top1

#Extraigo los valores
v <- getValues(image)
#Se eliminan los "na"
i <- which(!is.na(v))
#Se valoran los "na"
v <- na.omit(v)

#Generar el Kmeans,  (hacer una diapositiva)

E <- kmeans(v, 12, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)

#Kmeans con 2
E <- kmeans(v, 2, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)
#No la he guardado

#kmeans con 4
E <- kmeans(v, 4, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)

#kmeans con 6 
E <- kmeans(v, 6, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)

#kmeans con 8
E <- kmeans(v, 8, iter.max = 100, nstart = 10)

kmeans_raster <- raster(image)
kmeans_raster[i] <- E$cluster
plot(kmeans_raster)

#loading_ selección de

fviz_nbclust(sr_1000, kmeans, method = "wss")  

#Silueta
fviz_nbclust(sr_1000, kmeans, method = "silhouette")


# Mostrar los mapas con simbologia Categorica
kmeans_raster <- ratify(kmeans_raster)
rat <- levels(kmeans_raster)[[1]]
rat$grupos <- c('grupo1', 'grupo2', 'grupo3', 'grupo4')
rat$class <- c('grupo1', 'grupo2', 'grupo3', 'grupo4')
levels(kmeans_raster) <- rat
levelplot(kmeans_raster, col.regions=c('palegreen', 'midnightblue', 'indianred1','orange'))
