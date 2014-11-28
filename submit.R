source("import.R") 

## train the model using whole set of data
modFit <- train(Survived ~ Name + Sex + Pclass + SibSp + Parch + Fare + Embarked, 
								data = df,
                method = "rf",
								prox = TRUE)

## load test set
obj <- read.csv("data/test.csv")

## predict
pred <- as.integer(predict(modFit,newdata = obj) + 0.5)
write.matrix(x = pred,file = "data/mySubmit.csv", sep = ",")
