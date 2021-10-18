library(sp)
library(raster)
library(ggplot2)



#-----------------------------------------------------------------------------------------------------------------------------------
# 1. Set directory

#-----------------------------------------------------------------------------------------------------------------------------------

# 2. Carga de datos

# Abrir los CSV de tabla NDVI y tabla Humedad
precipindvi <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaPrecipitacion_para_ndvi.csv") 
humtopo <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

# Cálculo de correlación
Pre_Hum <- (merge(precipindvi, humtopo, by = 'X'))
corre   <- cor(Pre_Hum$mean.x, Pre_Hum$mean.y, method = c("pearson"))
corre
#[1] 0.07152969
# Cambio de nombre : categorias
Pre_Hum$grupo <- ifelse(Pre_Hum$Grupo.y =="Grupo1", "Elevación Baja", 
                        ifelse(Pre_Hum$Grupo.y=="Grupo2", "Elevación Media",
                               ifelse(Pre_Hum$Grupo.y =="Grupo3", "Elevación Alta",
                                      ifelse(Pre_Hum$Grupo.y =="Grupo4", "Elevación Muy Alta",""))))
# Orden de variables
level_order <- factor(Pre_Hum$grupo, level = c('Elevación Baja', 'Elevación Media', 'Elevación Alta', 'Elevación Muy Alta'))

#------------------------------------------------------------------------------------------------------------------------------------
# A. COMPORTAMIENTO DEL Precipitación EN CADA GRUPO TOPOGRAFICO

Summary(precipindvi)

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfy = Pre_Hum[, c('mean.y', 'min.y','max.y','sd.y','median.y')]  # Slice with columns name

## Grafico
graphic01ap <- ggplot(stack(dfy), aes(x = factor(ind, levels = names(dfy)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviación','Mínimo','Máximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfy)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersión del comportamiento de la Precipitación en la Geomorfometría") + # Título plot
  xlab("Medidas de tendencia central y dispersión")+    # Etiqueta del eje x
  ylab("NDVI")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviación','Mínimo','Máximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02ap <- ggplot(aes(y = mean.y, x = level_order), data = Pre_Hum) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de la Precipitación en cada grupo topográfico") + # Título del plot
  xlab("Categoría Geomorfométricas")+    # Etiqueta del eje x
  ylab("Media Precipitación (mm)")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03ap <- ggplot(aes(y = sd.y, x = level_order), data = Pre_Hum) + 
  stat_boxplot(geom = "errorbar",        # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",   # Color de los valores atípicos
               alpha = 0.9) +            # Transparencia del color de la caja
  ggtitle("Comportamiento de la Precipitación en cada grupo topografico") + # Título del plot
  xlab("Categoría Geomorfométricas")+    # Etiqueta del eje x
  ylab("Desviación Estándar Precipitación (mm)")+      # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01ap # Grafico Medidas de dispersión
graphic02ap # Gráfico Media
graphic03ap # Gráfico Desviación Estandar
#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA solape de EN CADA GRUPO TOPOGRAFICO
# 2. Carga de datos

# Abrir los CSV de tabla NDVI y tabla Humedad
preScipindvi <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaSOLAPEPrecipitacion_para_ndvi.csv")
humtopo <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas Unidas segunda prueba/NDVI/TablaEstadisticaHumedad_GrupoTopo_de_NDVI.csv")

# Cálculo de correlación
PreS_Hum <- (merge(preScipindvi, humtopo, by = 'X'))
corre   <- cor(PreS_Hum$mean.x, PreS_Hum$mean.y, method = c("pearson"))
corre
#[1] 0.1766227
# Cambio de nombre : categorias
PreS_Hum$grupo <- ifelse(PreS_Hum$Grupo.y =="Grupo1", "Elevación Baja", 
                        ifelse(PreS_Hum$Grupo.y=="Grupo2", "Elevación Media",
                               ifelse(PreS_Hum$Grupo.y =="Grupo3", "Elevación Alta",
                                      ifelse(PreS_Hum$Grupo.y =="Grupo4", "Elevación Muy Alta",""))))
# Orden de variables
level_order <- factor(PreS_Hum$grupo, level = c('Elevación Baja', 'Elevación Media', 'Elevación Alta', 'Elevación Muy Alta'))

#------------------------------------------------------------------------------------------------------------------------------------
# A. COMPORTAMIENTO DEL Precipitación EN CADA GRUPO TOPOGRAFICO

Summary(precipindvi)

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfy = PreS_Hum[, c('mean.y', 'min.y','max.y','sd.y','median.y')]  # Slice with columns name

## Grafico
graphic01apS <- ggplot(stack(dfy), aes(x = factor(ind, levels = names(dfy)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviación','Mínimo','Máximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfy)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersión del comportamiento de la Precipitación en la Geomorfometría") + # Título plot
  xlab("Medidas de tendencia central y dispersión")+    # Etiqueta del eje x
  ylab("NDVI")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviación','Mínimo','Máximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02apS <- ggplot(aes(y = mean.y, x = level_order), data = PreS_Hum) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de la 2ª Iteración de Precipitación en cada grupo topográfico") + # Título del plot
  xlab("Categoría Geomorfométricas")+    # Etiqueta del eje x
  ylab("Media Precipitación (mm)")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03apS <- ggplot(aes(y = sd.y, x = level_order), data = PreS_Hum) + 
  stat_boxplot(geom = "errorbar",        # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",   # Color de los valores atípicos
               alpha = 0.9) +            # Transparencia del color de la caja
  ggtitle("Comportamiento de la 2ª Iteración de Precipitación en cada grupo topografico") + # Título del plot
  xlab("Categoría Geomorfométricas")+    # Etiqueta del eje x
  ylab("Desviación Estándar Precipitación (mm)")+      # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01apS # Grafico Medidas de dispersión
graphic02apS # Gráfico Media
graphic03apS # Gráfico Desviación Estandar

#------------------------------------------------------------------------------------------------------------------------------------

##--------------------

# 3. Grupo de Cobertura

# 2. ANALISIS POR GRUPO DE COBERTURA
# 2. Carga de datos

# Abrir los CSV de tabla NDVI y tabla Humedad
Prendvicober <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaPrecipitacionparaNDVI_CoberVeg.csv")
humcober     <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaHumedad_CoberturaVeg_de_NDVICORREGIDA.csv")

# Cálculo de correlación
Pre_HumC <- (merge(Prendvicober, humcober, by = 'X'))
correc   <- cor(Pre_HumC$mean.x, Pre_HumC$mean.y, method = c("pearson"))
correc
#[1] 0.1599943
# Cambio de nombre : categorias
Pre_HumC$grupo <- ifelse(Pre_HumC$Grupo.y =="CoberturaBosque", "Bosques", 
                         ifelse(Pre_HumC$Grupo.y=="Cobertura_Matorral", "Matorral",
                                ifelse(Pre_HumC$Grupo.y =="Cobertura_Pastizal", "Pastizal",
                                       ifelse(Pre_HumC$Grupo.y =="Cobertura_VegetaEscasa", "Vegetación Escasa",""))))

# Orden de variables
level_order <- na.omit(factor(Pre_HumC$grupo, level = c('Bosques', 'Matorral', 'Pastizal', 'Vegetación Escasa')))

#------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA PRECIPITACION  EN CADA GRUPO cobertura

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfx = Pre_HumC[, c('mean.x', 'min.x','max.x','sd.x','median.x')]  # Slice with columns name

## Grafico
graphic01PC <- ggplot(stack(dfx), aes(x = factor(ind, levels = names(dfx)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviación','Mínimo','Máximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfx)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersión del comportamiento de SSM en la Geomorfometría") + # Título plot
  xlab("Medidas de tendencia central y dispersión")+    # Etiqueta del eje x
  ylab("SSM (%)")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviación','Mínimo','Máximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02PC <- ggplot(aes(y = mean.x, x = level_order), data = Pre_HumC) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de la Precipitación en cada cobertura vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media de Precipitación (mm)")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03PC <- ggplot(aes(y = sd.x, x = level_order), data = Pre_HumC) + 
  stat_boxplot(geom = "errorbar",         # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),     # Relleno caja
               outlier.colour = "red",    # Color de los valores atípicos
               alpha = 0.9) +             # Transparencia del color de la caja
  ggtitle("Comportamiento de la Precipitación en cada cobertura vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+     # Etiqueta del eje x
  ylab("Desviación Estándar de Precipitación (mm)")+ # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

#graphic01bc # Grafico Medidas de dispersión
graphic02PC # Gráfico Media
graphic03PC # Gráfico Desviación Estandar
#--------

#-----------------------------------------------------------------------------

# PRECIPITACION SOLAPE EN GRUPOS DE COBERTURA
# Abrir los CSV de tabla NDVI y tabla Humedad
Presndvicober <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaSOLAPEPreci_NDVI_CoberVeg.csv")
humcober     <-  read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/TABLAS DE LAS VARIABLES/Tablas de Cobertura y variables/NDVI/TablaEstadisticaHumedad_CoberturaVeg_de_NDVICORREGIDA.csv")

# Cálculo de correlación
Pres_HumC <- (merge(Presndvicober, humcober, by = 'X'))
correc   <- cor(Pres_HumC$mean.x, Pres_HumC$mean.y, method = c("pearson"))
correc
#[1] 0.1599943
# Cambio de nombre : categorias
Pres_HumC$grupo <- ifelse(Pres_HumC$Grupo.y =="CoberturaBosque", "Bosques", 
                         ifelse(Pres_HumC$Grupo.y=="Cobertura_Matorral", "Matorral",
                                ifelse(Pres_HumC$Grupo.y =="Cobertura_Pastizal", "Pastizal",
                                       ifelse(Pres_HumC$Grupo.y =="Cobertura_VegetaEscasa", "Vegetación Escasa",""))))

# Orden de variables
level_order <- na.omit(factor(Pres_HumC$grupo, level = c('Bosques', 'Matorral', 'Pastizal', 'Vegetación Escasa')))

#------------------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA PRECIPITACION  EN CADA GRUPO cobertura

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfx = Pres_HumC[, c('mean.x', 'min.x','max.x','sd.x','median.x')]  # Slice with columns name

## Grafico
graphic01PCs <- ggplot(stack(dfx), aes(x = factor(ind, levels = names(dfx)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviación','Mínimo','Máximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfx)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersión del comportamiento de SSM en la Geomorfometría") + # Título plot
  xlab("Medidas de tendencia central y dispersión")+    # Etiqueta del eje x
  ylab("SSM (%)")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviación','Mínimo','Máximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02PCs <- ggplot(aes(y = mean.x, x = level_order), data = Pres_HumC) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de la 2ª Precipitación en cada cobertura vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media de Precipitación (mm)")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03PCs <- ggplot(aes(y = sd.x, x = level_order), data = Pres_HumC) + 
  stat_boxplot(geom = "errorbar",         # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),     # Relleno caja
               outlier.colour = "red",    # Color de los valores atípicos
               alpha = 0.9) +             # Transparencia del color de la caja
  ggtitle("Comportamiento de la 2ª Precipitación en cada cobertura vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+     # Etiqueta del eje x
  ylab("Desviación Estándar de Precipitación (mm)")+ # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

#graphic01bc # Grafico Medidas de dispersión
graphic02PCs # Gráfico Media
graphic03PCs # Gráfico Desviación Estandar
#--------
