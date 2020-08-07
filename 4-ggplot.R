#install.packages('ggplot2')
#install.packages('hexbin')
#install.packages('reshape')

library(dplyr)
library('ggplot2')
library(hexbin)
library(reshape)
library(plotly)

# IRIS dataset ------------------------------------------------------------------------------------------
iris

# basic analysis of the dataset
dim(iris)
head(iris)
names(iris)
summary(iris)
str(iris)
cor(iris[1:nrow(iris),-5])
iris.cor <- cor(iris[1:nrow(iris),-5])

# sepal.Length and sepal.Width correlation analysis
iris.cor.melt <- melt(iris.cor)
iris.cor.melt

# ggplot graphs
ggplot(iris.cor.melt, aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  ggtitle('Correlation visualisation') + 
  scale_fill_gradient(low = 'white', high = 'red')

sep.l <- iris$Sepal.Length
sep.w <- iris$Sepal.Width

ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
  geom_point(aes(color = Species)) + 
  geom_density2d(colour = 'gray') + 
  ggtitle('Sepal width and length relation') + 
  theme_minimal()

ggplotly(
  ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
    geom_hex() + # Divides the plane into regular hexagons, counts the number of cases in each hexagon, and then (by default) maps the number of cases to the hexagon fill.
    ggtitle('Sepal width and length relation') + 
    theme_minimal() +
    scale_fill_gradient(low = 'white', high = 'blue')
)

ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
  geom_boxplot(aes(colour = Species)) + 
  ggtitle('Sepal width and length relation') + 
  theme_minimal()

# breast cancer------------------------------------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

# dataset
breast.cancer <- read.csv('https://raw.githubusercontent.com/analuisaortega/BEDU-R-2020/master/Data/breast_cancer.csv')

# dataset structure analysis
dim(breast.cancer)
head(breast.cancer)
str(breast.cancer)
summary(breast.cancer)

# central tendencies of 'median.perimeter'
median.perimeter <- median(breast.cancer$perimeter_mean)
mean.perimeter <- mean(breast.cancer$perimeter_mean)

# graph
breast.cancer %>% 
  ggplot(aes(perimeter_mean)) + 
  geom_histogram(colour = 'black', 
                 fill = 'blue', 
                 alpha = 0.5, 
                 binwidth = 3) + 
  ggtitle('Histogram for perimeter mean') + 
  labs(x = 'Radius Mean', y = 'Freq')+
  theme_minimal() +
  geom_vline(xintercept = median.perimeter, 
             linetype="dashed", 
             color = "red") + 
  geom_vline(xintercept = mean.perimeter,
             color = "orange") +
  facet_grid(diagnosis~.) + # 'B' is for benign, while 'M' is for malign
  scale_x_continuous(breaks = c(mean.perimeter, median.perimeter),labels = c('mean', 'median')) +
  theme(axis.text.x = element_text(angle = 45))

#----------------------------------------
# reto: encontrar la matriz de correlación de de 
# las variables numéricas continuas del dataset mtcars
mtcars
str(mtcars)

mtcars.continuos.numeric.values <- 
  data.frame(mtcars$mpg, mtcars$disp, mtcars$hp, mtcars$drat, mtcars$wt, mtcars$qsec)
mtcars[1, 3, 5, 6, 7] #??
mtcars[1,1]
head(mtcars.continuos.numeric.values)
cor(mtcars.continuos.numeric.values)  
?mtcars

library(ggplot2)
library(reshape)
mtcars.cor <- cor(mtcars.continuos.numeric.values) 
mtcars.cor.melt <- melt(mtcars.cor)
head(mtcars.cor.melt)

ggplot(mtcars.cor.melt, aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  ggtitle('Correlaciones mtcars') + 
  scale_fill_gradient(low = 'red', high = 'green') + 
  theme_classic()

ggplot(mtcars.continuos.numeric.values, aes(x = mtcars.wt)) +
  geom_histogram()

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(aes(colour = Species), shape = 15, alpha = .5, size = 3) + 
  ggtitle('Iris Sepal.Length / Sepal.Width') + 
  xlim(2, 4) +
  ylim(4.5, 7) +
  theme_classic() + 
  xlab('ancho de sepalo') + 
  ylab('largo de sepalo') + 
  scale_color_manual(values = c('#33FB79','navy','black'))


setwd("C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R")
breast.cancer <- read.csv("C:/Users/lenovo/OneDrive/career growth/data science/BEDU/data/R/breast_cancer.csv")
library(dplyr)
breast.cancer %>%
  select(-c(1,2,3)) %>%
  cor() %>%
  melt() %>%
  ggplot(aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  theme(axis.text.x=element_text(angle = -90, hjust = 0))


# historgramas
perimeter_mean <- breast.cancer$perimeter_mean
median.perimeter_mean <- median(perimeter_mean)
breast.cancer %>%
  ggplot(aes(perimeter_mean)) +
  labs(title = 'Breast cancer tumor perimeter (cm)', y = 'frequency', x = 'perimeter size (cm)') +
  geom_histogram(fill = 'pink',
                 color = 'purple', 
                 binwidth = 5) +
  geom_vline(xintercept = median(median.perimeter_mean),
             color = 'red',
             linetype = 'dashed')

median.perimeter_mean <- 
  median(breast.cancer$perimeter_mean)

