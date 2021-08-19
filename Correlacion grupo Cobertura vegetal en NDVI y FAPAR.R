library(sp)
library(raster)
library(ggplot2)



#-----------------------------------------------------------------------------------------------------------------------------------
# 1. Set directory

#-----------------------------------------------------------------------------------------------------------------------------------

# 2. Carga de datos

# Abrir los CSV de tabla NDVI y FAPAR
CoberNDVI <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas cobertura/TablaEstadisticaNDVI_CoberturaVeg.csv")
CoberFAPAR <- read.csv("D:/Análisis de Tesis en Rstudio y SAGA GIS/Codigos de estadisticas/CARPETA DE TRABAJO ACTUALIZADA AL DIA/Carpeta de codigos R para Carolina/Tablas cobertura/TablaFAPAR_CoberturaVegetal.csv")



# Cálculo de correlación
CoberNDVI_FAPAR <- (merge(CoberNDVI, CoberFAPAR, by = 'X'))
correnf <- cor(CoberNDVI_FAPAR$mean.x, CoberNDVI_FAPAR$mean.y, method = c("pearson"))
correnf
#[1] 0.8949273

# Cambio de nombre : categorias
CoberNDVI_FAPAR$grupo <- ifelse(CoberNDVI_FAPAR$Grupo.y =="CoberturaBosque", "Bosques", 
                        ifelse(CoberNDVI_FAPAR$Grupo.y=="Cobertura_Matorral", "Matorral",
                               ifelse(CoberNDVI_FAPAR$Grupo.y =="Cobertura_Pastizal", "Pastizal",
                                      ifelse(CoberNDVI_FAPAR$Grupo.y =="Cobertura_VegetaEscasa", "Vegetación Escasa",""))))

# Orden de variables
level_order <- na.omit(factor(CoberNDVI_FAPAR$grupo, level = c('Bosques', 'Matorral', 'Pastizal', 'Vegetación Escasa')))

#------------------------------------------------------------------------------------------------------------------------------------
# A. COMPORTAMIENTO DEL FAPAR EN CADA COBERTURA

Summary(vegndvitopo)

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfy = CoberNDVI_FAPAR[, c('mean.y', 'min.y','max.y','sd.y','median.y')]  # Slice with columns name

## Grafico
graphic01a <- ggplot(stack(dfy), aes(x = factor(ind, levels = names(dfy)), y = values)) + 
  scale_x_discrete(labels = c('Media','Desviación','Mínimo','Máximo','Mediana'))+
  stat_boxplot(geom = "errorbar", width = 0.2) +            # Bigotes
  geom_boxplot(aes(fill=factor(ind, levels = names(dfy)))) + # BOX
  ggtitle("Medidas de tendencia central y dispersión del comportamiento del FAPAR en la Cobertura Vegetal") + # Título plot
  xlab("Medidas de tendencia central y dispersión")+    # Etiqueta del eje x
  ylab("FAPAR")+                                         # Etiqueta del eje y  
  scale_fill_brewer(name="Leyenda",
                    labels=c('Media','Desviación','Mínimo','Máximo','Mediana'),
                    palette="Dark2")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black')  # Jitter points


# 2a. MEDIA
graphic02a <- ggplot(aes(y = mean.y, x = level_order), data = CoberNDVI_FAPAR) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en la Cobertura Vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media FAPAR")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03a <- ggplot(aes(y = sd.y, x = level_order), data = CoberNDVI_FAPAR) + 
  stat_boxplot(geom = "errorbar",        # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",   # Color de los valores atípicos
               alpha = 0.9) +            # Transparencia del color de la caja
  ggtitle("Comportamiento de FAPAR en la Cobertura Vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Desviación Estándar FAPAR")+      # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01a # Grafico Medidas de dispersión
graphic02a # Gráfico Media
graphic03a # Gráfico Desviación Estandar
#------------------------------------------------------------------------------------------------------------------------------------

# B. COMPORTAMIENTO DE LA NDVI EN CADA COBERTURA

# 1a. MEDIDAS DE DISPERSIÓN

## Sub dataframe de medidas de dispersión
dfx = CoberNDVI_FAPAR[, c('mean.x', 'min.x','max.x','sd.x','median.x')]  # Slice with columns name

## Grafico
graphic01b <- ggplot(stack(dfx), aes(x = factor(ind, levels = names(dfx)), y = values)) + 
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
graphic02b <- ggplot(aes(y = mean.x, x = level_order), data = CoberNDVI_FAPAR) + 
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot(aes(fill=level_order),    # Relleno caja
               outlier.colour = "red",  # Color de los valores atípicos
               alpha = 0.9) +           # Transparencia del color de la caja
  ggtitle("Comportamiento del NDVI en cada Cobertura Vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+    # Etiqueta del eje x
  ylab("Media de NDVI")+                    # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# 3a. DESVIACION
graphic03b <- ggplot(aes(y = sd.x, x = level_order), data = CoberNDVI_FAPAR) + 
  stat_boxplot(geom = "errorbar",         # Bigotes
               width = 0.2) +
  geom_boxplot(aes(fill=level_order),     # Relleno caja
               outlier.colour = "red",    # Color de los valores atípicos
               alpha = 0.9) +             # Transparencia del color de la caja
  ggtitle("Comportamiento del NDVI en cada Cobertura Vegetal") + # Título del plot
  xlab("Cobertura Vegetal")+     # Etiqueta del eje x
  ylab("Desviación Estándar de NDVI")+ # Etiqueta del eje y  
  scale_fill_discrete(name="Categoría")+
  geom_jitter(alpha = 0.1, width = 0.2,fill = 'black') 

# GRAFICAS

graphic01b # Grafico Medidas de dispersión
graphic02b # Gráfico Media
graphic03b # Gráfico Desviación Estandar
#------------------------------------------------------------------------------------------------------------------------------------




















