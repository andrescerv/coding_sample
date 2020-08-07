library(dplyr)
library(ggplot2)

# dataset used in the model:
cars

# exploring the dataset
cars %>% head(5)
str(cars)
summary(cars)
dim(cars)
cor(cars)

# smooth regression
scatter.smooth(x = cars$speed,
               y = cars$dist,
               main = 'Cars "distance / speed" relation')

# manual prediction
cars.lineal.model <- lm(dist ~ speed, data = cars)
cars.lineal.model # b_0 = - 17.579, b_1 = 3.932
summary(cars.lineal.model)
b_0 <- cars.lineal.model$coefficients[1]
b_1 <- cars.lineal.model$coefficients[2]
x_new <- 26 # any arbitrary number
y_new <- b_0 + b_1*x_new
y_new

# generic function for predictions from the results of fitting functions
predict(cars.lineal.model, data.frame(speed = c(26))) # any arbitrary number
predict(cars.lineal.model, data.frame(speed = c(26,30,42,57))) # any arbitrary vector

# graphs
# graph 1: using geom_smooth()
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  theme_minimal() +
  ggtitle('Linear regression of R dataset "cars"') +
  geom_smooth(method = 'lm', se = FALSE)

# graph 2: using geom_abline()
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  theme_minimal() +
  ggtitle('Linear regression of R dataset "cars"') +
  geom_abline(intercept = b_0, slope = b_1)
