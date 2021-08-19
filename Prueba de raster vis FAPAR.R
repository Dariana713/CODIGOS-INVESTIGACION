library(raster)
library(rasterVis)
library(maptools)
library(dichromat)
library("plot3D")

##

#TOPOGRAFIC
TOPO <- raster("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/Mask Cobertura Kmeas Topografic/Kmeasn_topogra4_mascaraCoberVeg.tif")

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/36 DIAS DE FAPAR")
fapar <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Humedades para FAPAR")
ssmf <- stack(list.files(pattern = ".tif"))
fapar_ssmf <- stack(ssmf, fapar)

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 TEMFA ESP")
TEMPtf <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/12 ETFA ESP")
ETf <- stack(list.files(pattern = ".tif"))


setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Dato de precipitación para FAPAR")
pref <- stack(list.files(pattern = ".tif"))

setwd("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/Datos de precipitacion FAPAR P ACUMULADA 5 dias antes y despues SSM")
prefSOL <-  stack(list.files(pattern = ".tif"))

pairs(ssm ~ fapar)
cor(ssm, fapar)
#significancia de la correlacion
cor.test(ssm, fapar)

#3D
x <- ssmf
y <- fapar
z <- pref

scatter3D(x, y, z, clab = c("Variables SSM, FAPAR, PRE", "Width (%, mm/dia)"))


prefSOL[prefSOL == 0] <- NA
newprefSOL <- na.omit(prefSOL)
pref[pref == 0] <- NA
newpref <- na.omit(pref)

which(is.na(fapar))



#Tratamiento de variables individuales ejemplo de NDVI en el tiempo
rasterToPoints(fapar)
test2f <- na.omit(rasterToPoints(fapar))
test3f <- subset(test2f, select = -c(x,y))
meanfapar <- apply(test3f,2,mean)
Dia <- 1:36
faparTiempo <- data.frame(Dia, meanfapar)
plot(faparTiempo)

#probar hacer este anova
reg1 <- lm(meanfapar ~ Dia, data = faparTiempo)
summary(reg1)
anova(reg1)

#Tratamiento de variables individuales ejemplo de SSM en el tiempo
rasterToPoints(ssmf)
testssmf2 <-  na.omit(rasterToPoints(ssmf))
testssmf3 <- subset(testssmf2, select = -c(x,y))
meanSSMf <- apply(testssmf3,2,mean)
Dia <- 1:36
SSMfTiempo <- data.frame(Dia, meanSSMf)
plot(SSMfTiempo)


#Tratamiento de variables individuales ejemplo de precipitacio en el tiempo
#MEDIA
rasterToPoints(pref)
testpref2 <-  na.omit(rasterToPoints(pref))
testpref3 <- subset(testpref2, select = -c(x,y))
meanPRECf <- apply(testpref3,2,mean)
Dia <- 1:36
prefTiempo <- data.frame(Dia, meanPRECf)
plot(prefTiempo)
#MEDIANA
medianPRECf <- apply(testpref3,2,median)
Dia <- 1:36
prefmediaTiempo <- data.frame(Dia, medianPRECf)
plot(prefmediaTiempo)

#Tratamiento de variables individuales ejemplo de precipitacion solape en el tiempo
#MEDIA
rasterToPoints(prefSOL)
testpresF2 <-  na.omit(rasterToPoints(prefSOL))
testpresF3 <- subset(testpresF2, select = -c(x,y))
meanPRECSF <- apply(testpresF3,2,mean)
Dia <- 1:36
presFTiempo <- data.frame(Dia, meanPRECSF)
plot(presFTiempo)
#MEDIANO
medianPRECSF <- apply(testpresF3,2,median)
Dia <- 1:36
presmedianFTiempo <- data.frame(Dia, medianPRECSF)
plot(presmedianFTiempo)

#Tratamiento de variables individuales ejemplo de ET en el tiempo
rasterToPoints(ETf)
testETf2 <-  na.omit(rasterToPoints(ETf))
testETf3 <- subset(testETf2, select = -c(x,y))
meanETf <- apply(testETf3,2,mean)
Mes <- 1:12
ETfTiempo <- data.frame(Mes, meanETf)
plot(ETfTiempo)

#Tratamiento de variables individuales ejemplo de TEM en el tiempo
rasterToPoints(TEMPtf)
testTEMPtf2 <-  na.omit(rasterToPoints(TEMPtf))
testTEMPtf3 <- subset(testTEMPtf2, select = -c(x,y))
meanTEMPtf <- apply(testTEMPtf3,2,mean)
Mes <- 1:12
TEMPfTiempo <- data.frame(Mes, meanTEMPtf)
plot(TEMPfTiempo)


#quitando los ceros de PRECIPITACION 
#PRECIPITACION NORMAL
rasterToPoints(newpref)
testnpf2 <-  na.omit(rasterToPoints(newpref))
testnpf3 <- subset(testnpf2, select = -c(x,y))
meannewPRECf <- apply(testnpf3,2,mean)
Dia <- 1:36
prefnewTiempo <- data.frame(Dia, meannewPRECf)
plot(prefnewTiempo)

#Tratamiento de variables individuales ejemplo de precipitacion solape en el tiempo
rasterToPoints(newprefSOL)
testpresnewF2 <-  na.omit(rasterToPoints(newprefSOL))
testpresnewF3 <- subset(testpresnewF2, select = -c(x,y))
meannewPRECSF <- apply(testpresnewF3,2,mean)
Dia <- 1:36
presnewFTiempo <- data.frame(Dia, meannewPRECSF)
plot(presnewFTiempo)


#Level

levelplot(fapar)
levelplot(fapar, layers = 1, margin = list(FUN = 'median'), contour=TRUE)
levelplot(ssmf, layers = 1, margin = list(FUN = 'median'), contour=TRUE)
#Other NDVI

myTheme <- rasterTheme(region = dichromat(terrain.colors(15)))
levelplot(fapar, par.settings = myTheme)
levelplot(ssmf, par.settings = RdBuTheme)
levelplot(preF, par.settings = RdBuTheme)
levelplot(prefSOL, par.settings = RdBuTheme)
levelplot(TEMPtf,  par.settings = RdBuTheme)
levelplot(ETf,  par.settings = RdBuTheme)


#other
splom(fapar_ssmf)
splom(ssmf)
splom(pref)
splom(prefSOL)
splom(ETf)
splom(TEMPtf)




enero <- raster(ssmf, 3)
levelplot(enero, par.settings = RdBuTheme)

feb <- raster(ssmf, 6)
levelplot(feb, par.settings = RdBuTheme)

marzo <- raster(ssmf, 9)
levelplot(marzo, par.settings = RdBuTheme)

abril <- raster(ssm, 12)
levelplot(abril, par.settings = RdBuTheme)

my<- raster(ssmf, 15)
levelplot(my, par.settings = RdBuTheme)

jn <- raster(ssmf, 18)
levelplot(jn, par.settings = RdBuTheme)

jl <- raster(ssmf, 21)
levelplot(jl, par.settings = RdBuTheme)

ago <- raster(ssm, 24)
levelplot(ago, par.settings = RdBuTheme)

sep <- raster(ssmf, 27)
levelplot(sep, par.settings = RdBuTheme)

oct <- raster(ssm, 30)
levelplot(oct, par.settings = RdBuTheme)

nov <- raster(ssm, 33)
levelplot(nov, par.settings = RdBuTheme)

dic <- raster(ssmf, 36)
levelplot(dic, par.settings = RdBuTheme)

humnf <- stack(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic)
levelplot(humnf, par.settings = RdBuTheme)
levelplot(enero, feb, marzo, abril, my, jn, jl, ago, sep, oct, nov, dic, par.settings = RdBuTheme)
splom(humnf)
histogram(humnf)
histogram(ssmf)


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
