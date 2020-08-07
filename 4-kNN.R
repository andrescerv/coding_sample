# install.packages('class')
library(class)

# the dataset that will be manipulated:
iris

# analyzing the dataset
str(iris)
dim(iris)
summary(iris)

# 80% of the 'iris' dataset is randomly extracted to train the model; the remaining 20% of 'iris' dataset will be used to test the model.
train_sample <- sample(1:nrow(iris),
                 size = 0.8*nrow(iris)) 

# the variables of the dataset are then then divided between independent variables, x, and one dependent variable, y.
# the 5th variable, 'species' is the one dependent variable 
iris_x_train <- iris[train_sample, -5]
iris_x_test <- iris[-train_sample, -5]
iris_y_train <-iris[train_sample, 'Species']
iris_y_test <-iris[-train_sample, 'Species']

# kNN algorithm
prediction <- knn(train = iris_x_train,
               test = iris_x_test,
               cl = iris_y_train,
               k = 3)
prediction

# the result 'prediction' is compared with 'iris_y_test'
con_mat <- table(prediction, iris_y_test)
con_mat
