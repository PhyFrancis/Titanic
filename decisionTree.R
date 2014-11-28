source("import.R") 

library(caret);

## train the model
modFit <- train(Survived ~ Name + Sex + Pclass + SibSp + Parch + Fare + Embarked, 
								data = training,
                method = "rf",
								prox = TRUE)

## print out model
print(modFit)

## predict
pred <- as.integer(predict(modFit,newdata=testing) + 0.5)
obs <- testing$Survived
confusionMatrix(obs, pred)
