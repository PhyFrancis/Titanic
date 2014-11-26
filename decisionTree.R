source("import.R") 

library(caret);
library(rattle);

## train the model
modFit <- train(Survived ~ Sex + Pclass + SibSp + Parch + Fare + Embarked, 
                method="rpart",data=training);

## print out model
print(modFit$finalModel)
pdf("data/tree.pdf")
plot(modFit$finalModel, uniform = TRUE,
     main = "Classification Tree")
text(modFit$finalModel, use.n = TRUE, all = TRUE, cex = .8)

## predict
pred <- as.integer(predict(modFit,newdata=testing) + 0.5)
obs <- testing$Survived
print(pred)
print(obs)
confusionMatrix(obs, pred)
