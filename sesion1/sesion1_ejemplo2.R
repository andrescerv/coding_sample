# calling DB 'iris'
iris

# describe table
nrow(iris)
ncol(iris)
dim(iris)
names(iris)

# pasting 
print('aaaa', ncol(iris))
paste('aaaa', ncol(iris))

# returning data from dataFrames
iris [1, 1]
iris[1, ]
iris[2:8, ]

#returning a column
iris[ , 1]
iris[ , c("Sepal.Length")]
iris$Sepal.Length
iris[1]

# returning columns
iris[ ,1:3]
iris[ ,-1]

# returning specific data
iris[18,2:3]

# adding data
data.frame(Sepal.Length = c(6,7),
           Sepal.Width = c(2.5,3.5),
           Petal.Length = c(3,3),
           Petal.Width = c(0.01,2.08),
           Species = c('virginica','versicolor'))

#adding rows (rbind)
iris.parte2 <- data.frame(Sepal.Length = c(6,7),
                          Sepal.Width = c(2.5,3.5),
                          Petal.Length = c(3,3),
                          Petal.Width = c(0.01,2.08),
                          Species = c('virginica','versicolor'))
df.iris <- rbind(iris,iris.parte2)
df

# adding columns (cbind)

# df functions
head(iris)
tail(iris)
unique(iris$Sepal.Length)

#change header names
names(iris)
names(iris) <- c("longitud.sepalo","ancho.sepalo",'longitud.petalo','ancho.petalo','especie')

