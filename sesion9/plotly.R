#install.packages("plotly")
library(dplyr)
library(plotly)
library(ggplot2)

# Un volado:{aguila, sol} con p{0.5, 0.5}
# Lanzar un dado: {1,2,3,4,5,6} con p{1/6, 1/6, 1/6, 1/6, 1/6, 1/6}
# Lanzar un dado alterado: {1,2,3,4,5,6} con p{1/2, 1/10, 1/10, 1/10, 1/10, 1/10}

# distribución uniforme

x <- runif(100000)
x <- runif(10, min = -1, max = 1)
?runif
x

plt <- data.frame(valores = x) %>%
  ggplot(aes(x = valores)) +
  geom_histogram(bins = 100,
                 fill = 'blue',
                 alpha = 0.6,
                 color = 'black') +
  scale_x_continuous(breaks = seq(0,1,0.1), lim = c(0,1)) +
    ggtitle('Simulación de 100,000 valores')

ggplotly(plt)

y <- rnorm(n = 1000000, mean = 0 ,sd = 1)
data.frame(valores = y) %>% 
  ggplot(aes(x = valores)) + 
  geom_histogram(bins = 100, 
                 fill = 'blue',
                 alpha= 0.6, 
                 color = 'black') + 
  scale_x_continuous(breaks = seq(-4,4,1), lim = c(-4,4)) +
  ggtitle('Simulación de 1,000,000 valores con dist Uniforme')

# Reto
# Simular 150,000 numeros aleatorios que sigan
# una distrbucion normal con media = 0, sd = 4, 
# graficarlo y pasarlo a ggplotly

y <- rnorm(n = 150000, mean = 0 ,sd = 4) %>%
  data.frame(valores = y) %>% 
    ggplot(aes(x = valores)) + 
    geom_histogram(bins = 100, 
                   fill = 'blue',
                   alpha= 0.6, 
                   color = 'black') + 
    scale_x_continuous(breaks = seq(-15,15,5), lim = c(-15,15)) +
    ggtitle('Simulación de 150,000 valores con dist Uniforme')

ggplotly(y)
