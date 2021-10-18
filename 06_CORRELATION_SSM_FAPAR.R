library(raster)
library(mapview)
library(rasterVis)
library(ggplot2)
library(mgcv)
library(caret)
library(spatialEco)

#-----------------------------------------------------------------------------------------------------------------------------------
# 1. Set directory


dat1 <- na.omit(as.data.frame(dat)) 
dat1$ETanualmean <- rowMeans(dat1[109:120]) 
dat1$SManualmean <- rowMeans(dat1[37:72]) 
dat1$Temanualmean <- rowMeans(dat1[121:132]) 
dat1$FAPARemanualmean <- rowMeans(dat1[1:36])
dat1$Preemanualmean <- rowMeans(dat1[73:108])

#Pruebas evapotranspiracion y humedad
ggplot(dat1, aes(x=ETanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

ggplot(dat1)+
  geom_smooth(aes(x=ETanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg)))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                          panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Evapotranspiracion (mm)")+ylab("SSM(%)") 

c <- train(SManualmean ~ ETanualmean, 
           data = dat1,
           method = "gam")
c


ggplot(dat1, aes(x=SManualmean, y=ETanualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_point() + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

fit1 <- bmrs(SManualmean ~ ETanualmean + (1|Kmeasn_topogra4_mascaraCoberVeg), data = dat1)
library(bmrs)

#Pruebas precipitacion  y humedad
ggplot(dat1, aes(x=Preemanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

ggplot(dat1)+
  geom_smooth(aes(x=Preemanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg)))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                             panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Precipitació (mm)")+ylab("SSM(%)") 


#Pruebas humedad y ndvi
ggplot(dat1, aes(x=SManualmean, y=FAPARemanualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

ggplot(dat1)+
  geom_smooth(aes(x=SManualmean, y=FAPARemanualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg)))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                              panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("SSM(%)")+ylab("FAPAR") 



#Pruebas temperatura  y humedad

ggplot(dat1, aes(x=Temanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

ggplot(dat1)+
  geom_smooth(aes(x=Temanualmean, y=SManualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg)))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                           panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Temperatura(º C)")+ylab("SSM(%)") 


t <- train(Temanualmean ~ SManualmean, 
           data = dat1,
           method = "gam")
t


ggplot(dat1)+
  geom_smooth(aes(x=Temanualmean, y=SManualmean, colour = y))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                     panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Temperatura (ºC)")+ylab("SSM(%)") 


#Pruebas eVAPOTRASNPIRACION Y FAPAR

ggplot(dat1, aes(x=ETanualmean, y=FAPARemanualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg))) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE) 

ggplot(dat1)+
  geom_smooth(aes(x=ETanualmean, y=FAPARemanualmean, color=as.factor(Kmeasn_topogra4_mascaraCoberVeg)))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                              panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Evapotranspiración (mm)")+ylab("FAPAR") 
ggplot(dat1)+
  geom_smooth(aes(x=ETanualmean, y=FAPARemanualmean, colour = y))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Evapotranspiración (mm)")+ylab("FAPAR") 
t <- train(FAPARemanualmean ~ ETanualmean, 
           data = dat1,
           method = "gam")
t

#-----------------------------------------------------------------------------------------------------------------------------------
# 2. Carga de datos

# Correlacion de SSM y FAPAR revisar el orden de X (ssm) ; Y(ndvi)

dat <- readRDS("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_ET_Temp_topo.rds")


#-----------------------------------------------------------------------------------------------------------------------------------
# 3. Correlaciónmethod = c("spearman")

corrn <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat@data[,36+i], y=dat@data[,i]))
  corrn[i] <- cor(df$x, df$y)
}
resn <- data.frame(Días=1:36, Correlación = corrn)
plot(resn, col='black', ylim=c(-0.5, 0.9), main="Correlación SSM y fapar")
lines(resn)
abline(h=0)
shapiro.test(corrn)
cor.test(x=df$x, y=df$y, method="spearman")
cor.test(x=df$x, y=df$y)

ggplot(df)+
  geom_smooth(aes(x=x, y=y, colour = y))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("SSM(%)")+ylab("NDVI") 

c <- train(y ~ x, 
           data = df,
           method = "gam",
           trControl = trainControl(method = "LOOCV", number = 1, repeats = 1),
           tuneGrid = data.frame(method = "GCV.Cp", select = FALSE)
)
# GRUPO 1 de correlacion humedad y NDVI
dat_topo1n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1, ]
corrn1 <- numeric()
for (i in 1:36){
  dfn1 <- na.omit(data.frame(x=dat_topo1n[,36+i], y=dat_topo1n[,i]))
  corrn1[i] <- cor(dfn1$x, dfn1$y)
}
res_topo1n  <- data.frame(Días=1:36, Correlación = corrn1)

lines(res_topo1n, col='aquamarine4')

# GRUPO 2 de correlacion humedad y NDVI

dat_topo2n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrn2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2n[,36+i], y=dat_topo2n[,i]))
  corrn2[i] <- cor(df$x, df$y)
}
res_topo2n  <- data.frame(day=1:36, correlations = corrn2)

lines(res_topo2n, col='orange')


# GRUPO 3 de correlacion humedad y NDVI

dat_topo3n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrn3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3n[,36+i], y=dat_topo3n[,i]))
  corrn3[i] <- cor(df$x, df$y)
}
res_topo3n  <- data.frame(day=1:36, correlations = corrn3)
lines(res_topo3n, col='blue')

# GRUPO 4 de correlacion humedad y NDVI

dat_topo4n <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4,]
corrn4 <- numeric()
for (i in 1:36){
  df4 <- na.omit(data.frame(x=dat_topo4n[,36+i], y=dat_topo4n[,i]))
  corrn4[i] <- cor(df4$x, df4$y)
}
res_topo4n <- data.frame(day=1:36, correlations = corrn4)

lines(res_topo4n, col='bisque')


#----------------------------------------------------

# 4. OTRAS PRUEBAS PARA VER LAS INTERACCIONES MENSUALES 
plot(dat@data[,37], y=dat@data[,1])
summary(dat@data[,c(1,37)])
cor(na.omit(dat@data[,c(1,37)]))
dat$meanSM <-  colMeans(dat@data[37:72])
dat$meanNDVI <- colMeans(dat@data[1:36])


#------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------------------------
# 4. Gráfico

df_restopon <- data.frame(c(resn[,(1:2)]), 
                          c(res_topo1n[,2]),
                          c(res_topo2n[,2]),
                          c(res_topo3n[,2]),
                          c(res_topo4n[,2])) 

colnames(df_restopon) <- c('dias','res_topo0n','res_topo1n', 'res_topo2n', 'res_topo3n', 'res_topo4n')

data_ggp <- data.frame(x = df_restopon$dias,                            # Reshape data frame
                       y = c(df_restopon$res_topo0n,
                             df_restopon$res_topo1n,
                             df_restopon$res_topo2n,
                             df_restopon$res_topo3n,
                             df_restopon$res_topo4n),
                       group = c(rep('res_topo0n', nrow(df_restopon)),
                                 rep('res_topo1n', nrow(df_restopon)),
                                 rep('res_topo2n', nrow(df_restopon)),
                                 rep('res_topo3n', nrow(df_restopon)),
                                 rep('res_topo4n', nrow(df_restopon))))

data_ggp$group <- ifelse(data_ggp$group =="res_topo0n", "SSM y NDVI", 
                         ifelse(data_ggp$group =="res_topo1n", 'Elevación Baja', 
                                ifelse(data_ggp$group=="res_topo2n", "Elevación Media",
                                       ifelse(data_ggp$group =="res_topo3n", "Elevación Alta",
                                              ifelse(data_ggp$group =="res_topo4n", "Elevación Muy Alta","")))))
colnames(data_ggp)[3] <- "Categoría"


ggp <- ggplot(data_ggp, aes(x, y, col = Categoría)) +    # Create ggplot2 plot
  geom_line(aes(linetype=Categoría),                 # Line type depends on col
            size = 1.05) +                           # Thicker line
  geom_point(aes(shape=Categoría),                   # Shape depends on col
             size = 2)+   
  ggtitle("Correlación SSM y NDVI") +                # Título plot
  xlab("Días/Año")+                                      # Etiqueta del eje x
  ylab("Correlación") + ylim(-0.5, 0.9)              # Etiqueta del eje y   
ggp 


#--------------------------------------------------------------------------------------

#. 1 Precipitacion y humedad
 dat <- readRDS("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Unión para hacer un rds y correlaciones/FAPAR/base_completa_fapar_ssm_pre_solape5diasantes_ET_Tem_topo.rds")
corrp <- numeric()
for (i in 1:36){
  dfpr <- na.omit(data.frame(x=dat@data[,i+72], y=dat@data[,i+36]))
  corrp[i] <- cor(dfpr$x, dfpr$y)
}
resp <- data.frame(day=1:36, correlations = corrp)
plot(resp, col='white', ylim=c(-0.5, 0.5))
lines(resp)
abline(h=0)

shapiro.test(corrp)
cor.test(x= dfpr$x, y= dfpr$y, method="spearman")
cor.test(x= dfpr$x, y= dfpr$y)

#Regresion
ggplot(dfpr)+
  geom_smooth(aes(x=x, y=y, colour = y, method = 'glm'))+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                panel.background = element_blank(), axis.line = element_line(colour = "black"))+ xlab("Precipitación(mm/dia")+ylab("SSM(%)") 

b <- train(y ~ x, 
           data = dfpr,
           method = "gam",
           trControl = trainControl(method = "LOOCV", number = 1, repeats = 1),
           tuneGrid = data.frame(method = "GCV.Cp", select = FALSE)
)

#Grupo 1 de correlacion Precipitacion con humedad 
dat_topo1p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 1,]
corrp1 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo1p[,i+72], y=dat_topo1p[,i+36]))
  corrp1[i] <- cor(df$x, df$y)
}
res_topo1p  <- data.frame(day=1:36, correlations = corrp1)

lines(res_topo1p, col='aquamarine4' )
#Grupo 2 de correlacion Precipitacion con humedad 

dat_topo2p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 2,]
corrp2 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo2p[,i+72], y=dat_topo2p[,i+36]))
  corrp2[i] <- cor(df$x, df$y)
}
res_topo2p  <- data.frame(day=1:36, correlations = corrp2)

lines(res_topo2p, col='orange')

#Grupo 3 de correlacion Precipitacion con humedad 

dat_topo3p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 3,]
corrp3 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo3p[,i+72], y=dat_topo3p[,i+36]))
  corrp3[i] <- cor(df$x, df$y)
}
res_topo3p <- data.frame(day=1:36, correlations = corrp3)
lines(res_topo3p, col='blue')

#Grupo 4 de correlacion Precipitacion con humedad 

dat_topo4p <- dat@data[dat@data$Kmeasn_topogra4_mascaraCoberVeg == 4,]
corrp4 <- numeric()
for (i in 1:36){
  df <- na.omit(data.frame(x=dat_topo4[,i+72], y=dat_topo4[,i+36]))
  corrp4[i] <- cor(df$x, df$y)
}
res_topo4p  <- data.frame(day=1:36, correlations = corrp4)

lines(res_topo4p, col='bisque')


#--------------------------------------------------------------------------------

# 2. Grafico

df_restopop <- data.frame(c(resp[,(1:2)]), 
                          c(res_topo1p[,2]),
                          c(res_topo2p[,2]),
                          c(res_topo3p[,2]),
                          c(res_topo4p[,2])) 

colnames(df_restopop) <- c('dias','res_topo0p','res_topo1p', 'res_topo2p', 'res_topo3p', 'res_topo4p')

data_ggp <- data.frame(x = df_restopon$dias,                            # Reshape data frame
                       y = c(df_restopop$res_topo0p,
                             df_restopop$res_topo1p,
                             df_restopop$res_topo2p,
                             df_restopop$res_topo3p,
                             df_restopop$res_topo4p),
                       group = c(rep('res_topo0p', nrow(df_restopop)),
                                 rep('res_topo1p', nrow(df_restopop)),
                                 rep('res_topo2p', nrow(df_restopop)),
                                 rep('res_topo3p', nrow(df_restopop)),
                                 rep('res_topo4p', nrow(df_restopop))))

data_ggp$group <- ifelse(data_ggp$group =="res_topo0p", "Precipitación y SSM", 
                         ifelse(data_ggp$group =="res_topo1p", 'Elevación Baja', 
                                ifelse(data_ggp$group=="res_topo2p", "Elevación Media",
                                       ifelse(data_ggp$group =="res_topo3p", "Elevación Alta",
                                              ifelse(data_ggp$group =="res_topo4p", "Elevación Muy Alta","")))))
colnames(data_ggp)[3] <- "Categoría"


ggp <- ggplot(data_ggp, aes(x, y, col = Categoría)) +    # Create ggplot2 plot
  geom_line(aes(linetype=Categoría),                 # Line type depends on col
            size = 1.05) +                           # Thicker line
  geom_point(aes(shape=Categoría),                   # Shape depends on col
             size = 2)+   
  ggtitle("Correlación Precipitación y SSM") +                # Título plot
  xlab("Días/Año")+                                      # Etiqueta del eje x
  ylab("Correlación") + ylim(-0.5, 0.9)              # Etiqueta del eje y   
ggp 
