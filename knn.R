# install.packages('class')
library(class)

random <- sample(1:nrow(iris),
                 size = 0.8*nrow(iris)) # en este paso se divide el dataset 'iris' en una muestra del 80% para el train; el otro 20% será para el test.
random

# train: x's
iris_train <- iris[random, -5]
# test: x's
iris_test <- iris[-random, -5]

# train: y's
iris_categoria_train <-iris[random, 'Species']
# test: y's
iris_categoria_test <-iris[-random, 'Species']

# algortimo knn
predict <- knn(train = iris_train,
               test = iris_test,
               cl = iris_categoria_train,
               k = 3)
predict

# comparar el resultado de 'predict' con 'iris_categoria_test'
con_mat <- table(predict, iris_categoria_test)
con_mat
