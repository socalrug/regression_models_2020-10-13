autoinsurance.data<- read.csv(file="exercises/PoissonExerciseData.csv", header=TRUE, sep=",", stringsAsFactors = TRUE)

#specifying reference category
gender.rel<- relevel(autoinsurance.data$gender, ref="F")

#fitting Poisson regression model
summary(fitted.model<- glm(accidents ~ gender.rel + age + miles, 
data=autoinsurance.data, family=poisson(link=log)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender.rel="F", age=35, 
miles=100), type="response"))
      