library(raster)
library(rasterVis)
library(maptools)
library(dichromat)
library(ggplot2)
library(ggpmisc)
library(plot3D)
library(maps)
##

#TOPOGRAFIC
TOPO <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36N dias de NDVI con mascara de cobertura")
ndvi <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias SSM")
ssm <- stack(list.files(pattern = ".tif"))
#ndvi_ssm <- stack(ssm, ndvi)

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12 TEMPN ESP")
TEMPt <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/12_ETN ESP")
ETn <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias Precipitación Acumulada en base a SSM con máscara Cobertura")
pre <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/NDVI/36 dias de precipitacion Acumulada 5 dias antes y durantes de SSM")
preSOLN <- stack(list.files(pattern = ".tif"))

pre_ssm <- stack(pre, ssm)


#Quitando los ceros de precipitación
preSOLN[preSOLN == 0] <- NA
newprenSOL <- na.omit(preSOLN)
pre[pre == 0] <- NA
newpre <- na.omit(pre)
NPR <- na.omit(newpre)

#Tratamiento de variables individuales ejemplo de NDVI en el tiempo
rasterToPoints(ndvi)
test2 <- na.omit(rasterToPoints(ndvi))
test3 <- subset(test2, select = -c(x,y))
meanNDVI <- apply(test3,2,mean)
Dia <- 1:36
NDVITiempo <- data.frame(Dia, meanNDVI)
plot(NDVITiempo)

#Tratamiento de variables individuales ejemplo de SSM en el tiempo
rasterToPoints(ssm)
testssm2 <-  na.omit(rasterToPoints(ssm))
testssm3 <- subset(testssm2, select = -c(x,y))
meanSSM <- apply(testssm3,2,mean)
Dia <- 1:36
SSMTiempo <- data.frame(Dia, meanSSM)
plot(SSMTiempo)


#Tratamiento de variables individuales ejemplo de precipitacio en el tiempo
rasterToPoints(pre)
testpre2 <-  na.omit(rasterToPoints(pre))
testpre3 <- subset(testpre2, select = -c(x,y))
meanPREC <- apply(testpre3,2,mean)
Dia <- 1:36
preTiempo <- data.frame(Dia, meanPREC)
plot(preTiempo)

#Tratamiento de variables individuales ejemplo de precipitacion solape en el tiempo
rasterToPoints(preSOLN)
testpres2 <-  na.omit(rasterToPoints(preSOLN))
testpres3 <- subset(testpres2, select = -c(x,y))
meanPRECS <- apply(testpres3,2,mean)
Dia <- 1:36
presTiempo <- data.frame(Dia, meanPRECS)
plot(presTiempo)


#Tratamiento de variables individuales ejemplo de ET en el tiempo
rasterToPoints(ETn)
testETn2 <-  na.omit(rasterToPoints(ETn))
testETn3 <- subset(testETn2, select = -c(x,y))
meanETn <- apply(testETn3,2,mean)
Dia <- 1:12
ETnTiempo <- data.frame(Dia, meanETn)
plot(ETnTiempo)

#Tratamiento de variables individuales ejemplo de TEM en el tiempo
rasterToPoints(TEMPt)
testTEMPt2 <-  na.omit(rasterToPoints(TEMPt))
testTEMPt3 <- subset(testTEMPt2, select = -c(x,y))
meanTEMPt <- apply(testTEMPt3,2,mean)
Dia <- 1:12
TEMPTiempo <- data.frame(Dia, meanTEMPt)
plot(TEMPTiempo)


#quitando los ceros de PRECIPITACION 
#PRECIPITACION NORMAL
rasterToPoints(newpre)
testnp2 <-  na.omit(rasterToPoints(newpre))
testnp3 <- subset(testnp2, select = -c(x,y))
meannewPREC <- apply(testnp3,2,mean)
Dia <- 1:36
prennewTiempo <- data.frame(Dia, meannewPREC)
plot(prennewTiempo)

#Tratamiento de variables individuales ejemplo de precipitacion solape en el tiempo
rasterToPoints(newprenSOL)
testpresnewn2 <-  na.omit(rasterToPoints(newprenSOL))
testpresnewn3 <- subset(testpresnewn2, select = -c(x,y))
meannewPRECSn <- apply(testpresnewn3,2,mean)
Dia <- 1:36
presnewnTiempo <- data.frame(Dia, meannewPRECSn)
plot(presnewnTiempo)


#Regresion
ggplot()+
  geom_smooth(aes(x=x, y=y, colour = y))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("SSM(%)")+ylab("NDVI") 



#Level

levelplot(ndvi)
levelplot(ndvi, layers = 1, margin = list(FUN = 'median'), contour=TRUE)
levelplot(ssm, layers = 1, margin = list(FUN = 'median'), contour=TRUE)
#Other NDVI

myTheme <- rasterTheme(region = dichromat(terrain.colors(15)))
levelplot(ndvi, par.settings = myTheme)
levelplot(TOPO, par.settings = myTheme)
levelplot(ssm, par.settings = RdBuTheme)
levelplot(pre, par.settings = RdBuTheme)
levelplot(preSOLN, par.settings = RdBuTheme)
levelplot(TEMPt,  par.settings = RdBuTheme)
levelplot(ETn,  par.settings = RdBuTheme)

#other
splom(ndvi)
splom(ssm)
splom(pre)
splom(ETn)
splom(TEMPt)
splom(TOPO)



enero <- raster(ssm, 3)
levelplot(enero, par.settings = RdBuTheme)

feb <- raster(ssm, 6)
levelplot(feb, par.settings = RdBuTheme)

marzo <- raster(ssm, 9)
levelplot(marzo, par.settings = RdBuTheme)

abril <- raster(ssm, 12)
levelplot(abril, par.settings = RdBuTheme)

my<- raster(ssm, 15)
levelplot(my, par.settings = RdBuTheme)

jn <- raster(ssm, 18)
levelplot(jn, par.settings = RdBuTheme)

jl <- raster(ssm, 21)
levelplot(jl, par.settings = RdBuTheme)

ago <- raster(ssm, 24)
levelplot(ago, par.settings = RdBuTheme)

sep <- raster(ssm, 27)
levelplot(sep, par.settings = RdBuTheme)

oct <- raster(ssm, 30)
levelplot(oct, par.settings = RdBuTheme)

nov <- raster(ssm, 33)
levelplot(nov, par.settings = RdBuTheme)

dic <- raster(ssm, 36)
levelplot(dic, par.settings = RdBuTheme)

humn <- stack(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic)
levelplot(humn, par.settings = RdBuTheme)
levelplot(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic, par.settings = RdBuTheme)
splom(humn)
histogram(humn)
histogram(ssm)
densityplot(ssm)
bwplot(ssm)
# et
enero <- raster(ETn, 1)
levelplot(enero, par.settings = RdBuTheme)

feb <- raster(ETn, 2)
levelplot(feb, par.settings = RdBuTheme)

marzo <- raster(ETn, 3)
levelplot(marzo, par.settings = RdBuTheme)

abril <- raster(ETn, 4)
levelplot(abril, par.settings = RdBuTheme)

my<- raster(ETn, 5)
levelplot(my, par.settings = RdBuTheme)

jn <- raster(ETn, 6)
levelplot(jn, par.settings = RdBuTheme)

jl <- raster(ETn, 7)
levelplot(jl, par.settings = RdBuTheme)

ago <- raster(ETn, 8)
levelplot(ago, par.settings = RdBuTheme)

sep <- raster(ETn, 9)
levelplot(sep, par.settings = RdBuTheme)

oct <- raster(ETn, 10)
levelplot(oct, par.settings = RdBuTheme)

nov <- raster(ETn, 11)
levelplot(nov, par.settings = RdBuTheme)

dic <- raster(ETn, 12)
levelplot(dic, par.settings = RdBuTheme)

etntodos <- stack(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic)
levelplot(etntodos, par.settings = RdBuTheme)
levelplot(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic, par.settings = RdBuTheme)
