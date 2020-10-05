real.estate.data<- read.csv(file="examples/GammaExampleData.csv", header=TRUE, sep=",", stringsAsFactors = TRUE)

#rescaling variables
price10K<- real.estate.data$price/10000
sqftK<-real.estate.data$sqft/1000
lotK<-real.estate.data$lot/1000

#plotting histogram with fitted normal density
library(rcompanion)
plotNormalHistogram(price10K)

#fitting gamma regression 
summary(fitted.model<- glm(price10K ~ beds + baths 
+ sqftK + heating + AC + lotK, data=real.estate.data,
family=Gamma(link=log)))


#using fitted model for prediction
print(10000*predict(fitted.model, type="response", data.frame(beds=4,
baths=2,sqftK=1.68, heating="central", AC="no", lotK=5)))

