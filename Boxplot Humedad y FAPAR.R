library(sp)
library(raster)
library(ggplot2)


# 2. Carga de datos

# Abrir los CSV de tabla NDVI y tabla Humedad
vegFAPARtopo <- read.csv("D:/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/144_TablaEstadisticaFAPAR_GrupoTopo.csv")
humtopoF <-  read.csv("D:/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/FAPAR/TablaEstadisticaHumedad_GrupoTopo_de_FAPAR.csv")

#Correlaci�n Humedad y FAPAR Topo
Hum_VegFAPAR <- (merge(humtopoF, vegFAPARtopo, by = 'X'))
corref <- cor(Hum_VegFAPAR$mean.x, Hum_VegFAPAR$mean.y, method = c("pearson"))
corref
#[1] -0.118254
# Cambio de nombre : categorias
Hum_VegFAPAR$grupo <- ifelse(Hum_VegFAPAR$Grupo.y =="Grupo1", "Elevaci�n Baja", 
                        ifelse(Hum_VegFAPAR$Grupo.y=="Grupo2", "Elevaci�n Media",
                               ifelse(Hum_VegFAPAR$Grupo.y =="Grupo3", "Elevaci�n Alta",
                                      ifelse(Hum_VegFAPAR$Grupo.y =="Grupo4", "Elevaci�n Muy Alta",""))))
# Orden de variables
level_order <- factor(Hum_VegFAPAR$grupo, level = c('Elevaci�n Baja', 'Elevaci�n Media', 'Elevaci�n Alta', 'Elevaci�n Muy Alta'))

#------------------------------------------------------------------------------------------------------------------------------------
# A. COMPORTAMIENTO DEL FAPAR EN CADA GRUPO TOPOGRAFICO

Summary(vegndvitopo)

# 1a. MEDIDAS DE DISPERSI�N

## Sub dataframe de medidas de dispersi�n
dfy = Hum_VegFAPAR[, c('mean.y', 'min.y','max.y','sd.y','median.y')]  # Slice with columns name

## Grafico
graphic01a <- ggplot(stack(dfy), aes(x = factor(ind, levels = names(dfy)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfy)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersi�n del comportamiento del NDVI en la Geomorfometr�a") + # T�tulo plot
  xlab("Medidas de tendencia central y dispersi�n")+    # Etiqueta del eje x
  ylab("NDVI")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02a <- ggplot(aes(y = mean.y, x = level_order), data = Hum_VegFAPAR) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores at�picos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en cada grupo topogr�fico") + # T�tulo del plot
  xlab("Categor�a Geomorfom�tricas")+    # Etiqueta del eje x
  ylab("Media FAPAR")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03a <- ggplot(aes(y = sd.y, x = level_order), data = Hum_VegFAPAR) + 
  stat_boxplot(geom = "errorbar",        # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",   # Color de los valores at�picos
               alpha = 0.9) +            # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en cada grupo topografico") + # T�tulo del plot
  xlab("Categor�a Geomorfom�tricas")+    # Etiqueta del eje x
  ylab("Desviaci�n Est�ndar FAPAR")+      # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01a # Grafico Medidas de dispersi�n
graphic02a # Gr�fico Media
graphic03a # Gr�fico Desviaci�n Estandar
#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA HUMEDAD EN CADA GRUPO TOPOGRAFICO

# 1a. MEDIDAS DE DISPERSI�N

## Sub dataframe de medidas de dispersi�n
dfx = Hum_VegFAPAR[, c('mean.x', 'min.x','max.x','sd.x','median.x')]  # Slice with columns name

## Grafico
graphic01b <- ggplot(stack(dfx), aes(x = factor(ind, levels = names(dfx)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfx)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersi�n del comportamiento de SSM en la Geomorfometr�a") + # T�tulo plot
  xlab("Medidas de tendencia central y dispersi�n")+    # Etiqueta del eje x
  ylab("SSM (%)")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02b <- ggplot(aes(y = mean.x, x = level_order), data = Hum_VegFAPAR) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores at�picos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento del SSM en cada grupo topogr�fico") + # T�tulo del plot
  xlab("Categor�a Geomorfom�tricas")+    # Etiqueta del eje x
  ylab("Media de SSM (%))")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03b <- ggplot(aes(y = sd.x, x = level_order), data = Hum_VegFAPAR) + 
  stat_boxplot(geom = "errorbar",         # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),     # Relleno caja
               outlier.colour = "red",    # Color de los valores at�picos
               alpha = 0.9) +             # Transparencia del color de la caja
  ggtitle("Comportamiento del SSM en cada grupo topografico") + # T�tulo del plot
  xlab("Categor�a Geomorfom�tricas")+     # Etiqueta del eje x
  ylab("Desviaci�n Est�ndar de SSM (%)")+ # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01b # Grafico Medidas de dispersi�n
graphic02b # Gr�fico Media
graphic03b # Gr�fico Desviaci�n Estandar
#------------------------------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------

# 2. ANALISIS POR GRUPO DE COBERTURA
# 2. Carga de datos

# Abrir los CSV de tabla fapar y tabla Humedad
vegFAPARc <- read.csv("D:/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaFAPAR_CoberturaVegetal.csv")
humtopoFc <-  read.csv("D:/An�lisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/FAPAR/TablaEstadisticaHumedad_CoberturaVeg_de_FAPARCORREGIDA.csv")

# C�lculo de correlaci�n
Hum_VegFAPARc <- (merge(humtopoFc, vegFAPARc, by = 'X'))
correc   <- cor(Hum_VegFAPARc$mean.x, Hum_VegFAPARc$mean.y, method = c("pearson"))
correc
#[1] 0.107175
# Cambio de nombre : categorias
Hum_VegFAPARc$grupo <- ifelse(Hum_VegFAPARc$Grupo.y =="CoberturaBosque", "Bosques", 
                         ifelse(Hum_VegFAPARc$Grupo.y=="Cobertura_Matorral", "Matorral",
                                ifelse(Hum_VegFAPARc$Grupo.y =="Cobertura_Pastizal", "Pastizal",
                                       ifelse(Hum_VegFAPARc$Grupo.y =="Cobertura_VegetaEscasa", "Vegetaci�n Escasa",""))))

# Orden de variables
level_order <- na.omit(factor(Hum_VegFAPARc$grupo, level = c('Bosques', 'Matorral', 'Pastizal', 'Vegetaci�n Escasa')))

#------------------------------------------------------------------------------------------------------------------------------------
# 1a. MEDIDAS DE DISPERSI�N

## Sub dataframe de medidas de dispersi�n
dfy = Hum_VegFAPARc[, c('mean.y', 'min.y','max.y','sd.y','median.y')]  # Slice with columns name

## Grafico
graphic01ac <- ggplot(stack(dfy), aes(x = factor(ind, levels = names(dfy)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfy)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersi�n del comportamiento del NDVI en la Cobertra Vegetal") + # T�tulo plot
  xlab("Medidas de tendencia central y dispersi�n")+    # Etiqueta del eje x
  ylab("NDVI")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02ac <- ggplot(aes(y = mean.y, x = level_order), data = Hum_VegFAPARc) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores at�picos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en cada cobertura vegetal") + # T�tulo del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media FAPAR")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03ac <- ggplot(aes(y = sd.y, x = level_order), data = Hum_VegFAPARc) + 
  stat_boxplot(geom = "errorbar",        # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",   # Color de los valores at�picos
               alpha = 0.9) +            # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en cada cobertura vegetal") + # T�tulo del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Desviaci�n Est�ndar FAPAR")+      # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01ac # Grafico Medidas de dispersi�n
graphic02ac # Gr�fico Media
graphic03ac # Gr�fico Desviaci�n Estandar
#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA HUMEDAD EN CADA GRUPO cobertura

# 1a. MEDIDAS DE DISPERSI�N

## Sub dataframe de medidas de dispersi�n
dfx = Hum_VegFAPARc[, c('mean.x', 'min.x','max.x','sd.x','median.x')]  # Slice with columns name

## Grafico
graphic01b <- ggplot(stack(dfx), aes(x = factor(ind, levels = names(dfx)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfx)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersi�n del comportamiento de SSM en la Geomorfometr�a") + # T�tulo plot
  xlab("Medidas de tendencia central y dispersi�n")+    # Etiqueta del eje x
  ylab("SSM (%)")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviaci�n','M�nimo','M�ximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02bc <- ggplot(aes(y = mean.x, x = level_order), data = Hum_VegFAPARc) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores at�picos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento del SSM en cada cobertura vegetal") + # T�tulo del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media de SSM (%))")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03bc <- ggplot(aes(y = sd.x, x = level_order), data = Hum_VegFAPARc) + 
  stat_boxplot(geom = "errorbar",         # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),     # Relleno caja
               outlier.colour = "red",    # Color de los valores at�picos
               alpha = 0.9) +             # Transparencia del color de la caja
  ggtitle("Comportamiento del SSM en cada cobertura vegetal") + # T�tulo del plot
  xlab("Cobertura Vegetal")+     # Etiqueta del eje x
  ylab("Desviaci�n Est�ndar de SSM (%)")+ # Etiqueta del eje y  
  scale_fill_discrete(name="Categor�a")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

#graphic01bc # Grafico Medidas de dispersi�n
graphic02bc # Gr�fico Media
graphic03bc # Gr�fico Desviaci�n Estandar
#--------

