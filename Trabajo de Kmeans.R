# Trabajo de Kmeans

library(ggpubr) 

library(factoextra)
data("iris")
df <- iris
head(df, 3)
# Compute k-means with k = 3
set.seed(123)
# Se genera un nuevo objeto de KMedia, Scale centra las medias en cero, se elimina la variable categorica y se agrupen 
res.km <- kmeans(scale(df[, -5]), 3, nstart = 25)
# K-means clusters showing the group of each individuals (resultado del agrupamiento)
res.km$cluster
fviz_cluster(res.km, data = df[, -5],
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"),
             geom = "point",
             ellipse.type = "convex",
             ggtheme = theme_bw())


# Se genera un nuevo objeto de KMedia, Scale centra las medias en cero, se elimina la variable categorica

#primer ejercicio

res.km <- kmeans(scale(df[, -5]), 5, nstart = 25)
# K-means clusters showing the group of each individuals (resultado del agrupamiento)
res.km$cluster

?kmeans
?head
?set.seed
?nstart
