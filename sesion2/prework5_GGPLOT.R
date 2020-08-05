iris
ncol(iris)
names(iris)
nrow(iris)
str(iris)

library(dplyr)

names(iris)

sep.w <- iris$Sepal.Width
sep.w

# DATOS NUMÉRICOS
# medidas de centralidad
mean(sep.w)
median(sep.w)
table(sep.w)

? table()

my.v <- c(6, 6, 1, 4, 3.3, 9.9, 10, 3, 2, 4, 5, 3.3, 6, 7)

# medidas de dispersión
var(sep.w)
sd(sep.w)
max(sep.w)-min(sep.w)

# medidas de distribución
quantile(sep.w)
quantile(sep.w, prob = c(0.25, 0.5, 0.75))
summary(sep.w)


# DATOS CATEGORICOS
species <- iris$Species
table(species)
length(species)
table(species)/length(species)
round(table(species)/length(species), 2)

# las siguientes funciones imprimen el nombre de las columnas en alguna parte
str(iris)
summary(iris)
names(iris)


# CORRELACIÓN
cor(iris$Sepal.Width, iris$Sepal.Length)

num.col <- c('Sepal.Width','Sepal.Length','Petal.Width','Petal.Length')
iris.numeric <- iris[ , num.col]
head(iris.numeric)
cor(iris.numeric)

sep.l <- iris$Sepal.Length

#   GGPLOT
  # structura: ggplot(data, aes(x, y)) + geom_point()
#install.packages('ggplot2')
library('ggplot2')
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point()
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point(aes(color = Species))
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point(aes(color = Species)) + ggtitle('Sepal width and length relation')
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point(aes(color = Species)) + geom_density2d(colour = 'black') + ggtitle('Sepal width and length relation')
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point(aes(color = Species)) + geom_density2d(colour = 'black') + ggtitle('Sepal width and length relation') + theme_minimal()
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_point(aes(color = Species)) + ggtitle('Sepal width and length relation') + theme_minimal() + facet_wrap('Species')
#install.packages('hexbin')
library(hexbin)
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_hex() + ggtitle('Sepal width and length relation') + theme_minimal() + scale_fill_gradient(low = 'white', high = 'blue')
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + geom_boxplot(aes(colour = Species)) + ggtitle('Sepal width and length relation') + theme_dark()
#install.packages('reshape')
library(reshape)
iris.cor <- cor(iris.numeric)
iris.cor.melt <- melt(iris.cor)
iris.cor.melt
ggplot(iris.cor.melt, aes(X1, X2))
ggplot(iris.cor.melt, aes(X1, X2)) + geom_tile(aes(fill = value))
ggplot(iris.cor.melt, aes(X1, X2)) + geom_tile(aes(fill = value)) + ggtitle('Correlation visualisation')
ggplot(iris.cor.melt, aes(X1, X2)) + geom_tile(aes(fill = value)) + ggtitle('Correlation visualisation') + scale_fill_gradient(low = 'white', high = 'red')
