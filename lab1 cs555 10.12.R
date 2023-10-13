#wenong xie 2023.10.12

library(MASS)
library(ISLR)
#1
# Fit the linear model
myModel <- lm(medv ~ ., data=Boston)

anova(myModel)
coefficients(myModel)
coef(myModel)
confint(myModel)
fitted(myModel)
residuals(myModel)
resid(myModel)
deviance(myModel)
summary(myModel)

 myModel2 = lm(medv ~ . , subset= 1:100 , data=Boston)
 #This will fit a linear model similar to myModel, but only using the first 
 #100 observations in the Boston data.
 
 
#2

model_lstat <- lm(medv ~ lstat, data=Boston)
summary(model_lstat)$coefficients
#since the p-value is larger than 0.05, it is not important 
summary(model_lstat)$fstatistic
#601.6179

summary(model_lstat)$coefficients["lstat", "t value"]
#-24.5279
summary(model_lstat)$coefficients["lstat", "Pr(>|t|)"]
plot(Boston$medv, residuals(model_lstat), xlab="medv", ylab="Residuals", 
     main="Residuals vs medv")

plot(Boston$lstat, residuals(model_lstat), xlab="lstat", ylab="Residuals", 
     main="Residuals vs lstat")

new_data <- data.frame(lstat=2:15)
#2.11
predictions <- predict(model_lstat, newdata=new_data)


#3
#3.11
myModelQ1 = lm(medv ~ age + lstat , data=Boston)
#3.12
myModelQ2 = lm(medv ~ . , subset= 1:100 , data=Boston)
#3.1b
summary(myModelQ1)$coefficients
#since the p-value here is less than 0.05, it is important 

#3.1d
summary(myModelQ2)$coefficients

#3.2
set.seed(123) # for reproducibility
trainIndex <- sample(1:nrow(Boston), 0.8 * nrow(Boston))
trainData <- Boston[trainIndex, ]

myModelTrain <- lm(medv ~ age + lstat, data=trainData)

#3.3
par(mfrow=c(2,2))
plot(myModelQ2)




#4
#4.1
summary(myModelQ1)$coefficients
#4.2
summary(myModelQ2)$coefficients

#4.3
myModelQ3 = lm(I(medv^2) ~ crim + zn + chas + nox + rm + age + lstat, 
               data=Boston)
#4.4
myModelQ4 = lm(medv ~ crim + zn + chas + nox + rm + age + lstat + I(rm+lstat), 
               data=Boston)
#commentthe NA value: 
#4.5
myModelQ5 = lm(medv ~ crim + zn + chas + nox + rm + age + lstat + rm*lstat, 
               data=Boston)
#4.6
myModelQ6 = lm(medv ~ crim + zn + chas + nox + rm + age + lstat + I(lstat^2), 
               data=Boston)


#5


#5.1
summaryModel <- summary(myModelQ1)
summaryModel$fstatistic[3]

#5.2
pval <- pf(summaryModel$fstatistic[1], summaryModel$fstatistic[2], summaryModel$fstatistic[3], lower.tail=FALSE)
coefs <- coef(summary(myModelQ1))





 