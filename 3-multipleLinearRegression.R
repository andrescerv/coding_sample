library(dplyr)
library(ggplot2)
library(plotly)

# dataset that wil be used
longley # A macroeconomic data set which provides a well-known example for a highly collinear regression.

# Analyzing the dataset
?longley 
head(longley)
summary(longley)
dim(longley)
cor(longley)

# linear regression model
longley %>%
  select(GNP, Employed)

linear.model <- lm(Employed ~ GNP, data = longley)
b_0 <- linear.model$coefficients[1] # 51.84359
b_1 <- linear.model$coefficients[2] # 0.03475

predict(linear.model, data.frame(GNP = c(75,200,300,400,500,600)))

ggplotly(
  ggplot(longley, aes(x = GNP, y = Employed)) +
    geom_point() +
    theme_minimal() +
    ggtitle('Linear regression of R dataset "longley"') +
    geom_smooth(method = 'lm', se = FALSE)
)

#------------------------------------------------------------------
# multiple linear regression model 
lm_longley <- lm(Employed ~ ., data = longley) # the dot '.' is used to take all the variables into account except the y variable, 'Employed'
lm_longley
summary(lm_longley)

# predict 'Employed' when x1=120, x2=500, x3=500, x4=300, x5=100, x6=1960
predict(lm_longley, data.frame(GNP.deflator = c(120), 
                               GNP = c(500),
                               Unemployed = c(500),
                               Armed.Forces = c(300),
                               Population = c(100),
                               Year = c(1960)))