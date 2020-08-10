library(dplyr)
library('ggplot2')
library(hexbin)
library(reshape)
library(plotly)

# IRIS dataset ------------------------------------------------------------------------------------------
iris

# basic analysis
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

# graph 1.1: iris variable correlations
ggplot(iris.cor.melt, aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  ggtitle('Correlation visualisation') + 
  scale_fill_gradient(low = 'white', high = 'red') + 
  theme(axis.text.x = element_text(angle = 90))

# graph 1.2: iris density graph, sepal width vs sepal length
sep.l <- iris$Sepal.Length
sep.w <- iris$Sepal.Width
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
  geom_point(aes(color = Species)) + 
  geom_density2d(colour = 'gray') + 
  ggtitle('Sepal width and length relation') + 
  theme_minimal()

# graph 1.3: iris density graph in hexagons, sepal width vs sepal length
ggplotly(
  ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
    geom_hex() + # Divides the plane into regular hexagons, counts the number of cases in each hexagon, and then (by default) maps the number of cases to the hexagon fill.
    ggtitle('Sepal width and length relation') + 
    theme_minimal() +
    scale_fill_gradient(low = 'white', high = 'blue')
)

# graph 1.4: iris box and whiskers plot, sepal width vs sepal length
ggplot(data = iris, aes(x = sep.l, y = sep.w)) + 
  geom_boxplot(aes(colour = Species)) + 
  ggtitle('Sepal width and length relation') + 
  theme_minimal()

# BREAST CANCER dataset------------------------------------------------------------------------------------------------------
breast.cancer <- read.csv('https://raw.githubusercontent.com/analuisaortega/BEDU-R-2020/master/Data/breast_cancer.csv')

# basic analysis
dim(breast.cancer)
names(breast.cancer)
head(breast.cancer)
summary(breast.cancer)
str(breast.cancer)

# central tendencies of 'median.perimeter'
median.perimeter <- median(breast.cancer$perimeter_mean)
mean.perimeter <- mean(breast.cancer$perimeter_mean)
breast.cancer$perimeter_mean

# graph 2.1: histogram of perimeter mean divided between B, 'benign', and M, 'malign' 
ggplot(data = breast.cancer, aes(breast.cancer$perimeter_mean)) + 
  geom_histogram(colour = 'black', 
                 fill = 'blue', 
                 alpha = 0.5, 
                 binwidth = 3) + 
  ggtitle('Perimeter mean (mm) frequency') + 
  labs(x = 'Radius Mean', y = 'Freq')+
  theme_minimal() +
  geom_vline(xintercept = median.perimeter, 
             linetype="dashed", 
             color = "red") + 
  geom_vline(xintercept = mean.perimeter,
             color = "orange") +
  facet_grid(diagnosis~.) + # 'B' stands for benign, while 'M' stands for malign
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_x_continuous(breaks = c(mean.perimeter, median.perimeter),labels = c('mean', 'median'))

# graph 2.2: breast cancer tumor perimeter (mm) frequency
breast.cancer %>%
  ggplot(aes(perimeter_mean)) +
  labs(title = 'Breast cancer tumor perimeter (mm)', y = 'frequency', x = 'perimeter size (mm)') +
  geom_histogram(fill = 'pink',
                 color = 'purple', 
                 binwidth = 5) +
  geom_vline(xintercept = median(median.perimeter_mean),
             color = 'red',
             linetype = 'dashed')

#MTCARS dataset-------------------------------------------------------------------------------------------
mtcars

# basic analysis
dim(mtcars)
names(mtcars)
head(mtcars)
summary(mtcars)
str(mtcars)

# filtrating continuous numeric variables
mtcars.continuos.numeric.values <- 
  data.frame(mtcars$mpg, mtcars$disp, mtcars$hp, mtcars$drat, mtcars$wt, mtcars$qsec)

# preparing mtcars correlation analysis
cor(mtcars.continuos.numeric.values)  
mtcars.cor <- cor(mtcars.continuos.numeric.values) 
mtcars.cor.melt <- melt(mtcars.cor)
head(mtcars.cor.melt)

# graph 3.1: mtcars all-vs-all correlation graph
ggplot(mtcars.cor.melt, aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  ggtitle('Correlaciones mtcars') + 
  scale_fill_gradient(low = 'white', high = 'green') + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90))