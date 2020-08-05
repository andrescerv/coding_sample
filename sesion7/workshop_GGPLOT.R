#25-jul-2020
#sesion 7
# Cargamos paquetes
library(dplyr)
library(ggplot2)
#Leemos archivo de breast_cancer
breast.cancer <- read.csv('https://raw.githubusercontent.com/analuisaortega/BEDU-R-2020/master/Data/breast_cancer.csv')
# Vemos la estructura
str(breast.cancer)
# Obtenemos la mediana de la variable radius_mean
median.perimeter <- median(breast.cancer$perimeter_mean)
mean.perimeter <- mean(breast.cancer$perimeter_mean)
# graficamos el histograma y densidad de la variable radius_mean
breast.cancer %>% ggplot(aes(perimeter_mean)) + 
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
             color = 'orange') +
  facet_wrap(~diagnosis)

# Reto 0: en lugar de agrefar la capa de facet_wrap(), agregar la capa de facet_grid()
breast.cancer %>% ggplot(aes(perimeter_mean)) + 
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
  facet_grid(diagnosis~.)


# Reto 00: agregar 2 capas de texto que, con color rojo, digan 'mean' y, con naranja, 'median'
breast.cancer %>% ggplot(aes(perimeter_mean)) + 
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
             color = 'orange') +
  facet_grid(~diagnosis) #+
  annotate(geom = 'text', label = 'median')
  
# Agregar una columna adicional al gráfico
str(breast.cancer)
summary(breast.cancer$symmetry_worst)
# dividir breast.cancer$symmetry_worst en tres grupos
col.cat <- breast.cancer$symmetry_worst
ifelse(col.cat <= mean(col.cat), 
       'bajo',
       'alto')
breast.cancer$symmetry_worst.bajoAlto <- ifelse(col.cat <= mean(col.cat), 'bajo', 'alto')
# gráfico
breast.cancer %>% ggplot(aes(perimeter_mean)) + 
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
  facet_grid(symmetry_worst.bajoAlto~diagnosis)

# Dividir breast.cancer$symmetry_worst en cuartiles
  # reto: crear 3 variables donde tengan 1q, 2q, 3q de symmetry.worst
  symmetry_worst.quantiles <- quantile(breast.cancer$symmetry_worst, c(0.25, 0.5, 0.75))
  breast.cancer$symmetry_worst.byQuantile <-
    ifelse(breast.cancer$symmetry_worst <= symmetry_worst.quantiles[1],
           '1q',
           ifelse(breast.cancer$symmetry_worst <= symmetry_worst.quantiles[2],
                  '2q',
                  ifelse(breast.cancer$symmetry_worst <= symmetry_worst.quantiles[3],
                         '3q',
                         '4q')))
  
  # gráfico
  breast.cancer %>% ggplot(aes(perimeter_mean)) + 
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
    facet_grid(~symmetry_worst.byQuantile~diagnosis)
  
# graficando mpg
library(dplyr)
library(ggplot2)
?mpg
head(mpg)
str(mpg)
summary(mpg)

mpg %>%
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point()

# Reto: crear para cada distinto cilindraje (cyl)
unique(mpg$cyl)

mpg %>%
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  facet_grid(~cyl)
  