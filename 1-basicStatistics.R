library(modeest)

# dataset
breast.cancer <- read.csv('https://raw.githubusercontent.com/analuisaortega/BEDU-R-2020/master/Data/breast_cancer.csv')

# basic analysis of dataset
head(breast.cancer)
names(breast.cancer)
str(breast.cancer)
summary(breast.cancer)

# selecting variables of interest
wanted.cols <- c('id','diagnosis','radius_mean','perimeter_mean','radius_worst','perimeter_worst')
breast.cancer.filter <- breast.cancer[,wanted.cols]
interest.col <- breast.cancer.filter$radius_mean

# central tendency analysis
mean(interest.col)
median(interest.col)
mfv(interest.col)
sort(interest.col)

# measures of spread
var(interest.col)
sd(interest.col)
sd(interest.col)**2 == var(interest.col)
max(interest.col) - min(interest.col) # range 
ceiling(max(interest.col) - min(interest.col))
quantile(interest.col)
quantile(interest.col, c(1/3, 2/3))

# quantiles
quantile(interest.col)
cut(interest.col, breaks = quantile(interest.col))

# deciles
quantile(interest.col, c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))
cut(interest.col, breaks = quantile(interest.col, c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)))

# percentiles
quantile(interest.col, seq(from = 0, to = 1, by = 0.01))
cut(interest.col, breaks = quantile(interest.col, seq(from = 0, to = 1, by = 0.01)))

# range of the 85% smallest data
quantile(interest.col, c(0, 0.85))

# range of the 68% most central data
quantile(interest.col, c((0.5-0.68/2),(0.5+0.68/2)))

# graph 1: histogram of breast cancer tumor radius mean
hist(interest.col,
     main="Breast cancer tumor radius mean",
     xlab="mm",
     col="darkmagenta"
)
