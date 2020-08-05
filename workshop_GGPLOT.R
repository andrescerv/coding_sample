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