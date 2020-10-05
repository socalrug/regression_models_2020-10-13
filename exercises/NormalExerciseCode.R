HR.data<- read.csv(file="exercises/NormalExerciseData.csv", header=TRUE, sep=",", stringsAsFactors = TRUE)

#plotting histogram with fitted normal density
library(rcompanion)
plotNormalHistogram(HR.data$HR)

#fitting general linear model
summary(fitted.model<- glm(HR ~ age + gender + ethnicity + BMI + nmeds + AQI,
data=HR.data, family=gaussian(link=identity)))

#estimating sigma
print(sigma.hat<- sigma(fitted.model))

#using fitted model for prediction
print(predict(fitted.model, data.frame(age=50, gender="M", 
ethnicity="Hispanic", BMI=20, nmeds=0, AQI="moderate")))


