source("resample.R") 

library(caret);

## train the model
modFit <- list();
for(i in 1:length(folds)) {
	modFit[[i]] <- train(Survived ~ Sex + Pclass + SibSp + Parch + Fare + Embarked, 
 									method="rpart",
									data = training[folds[[i]],]);
}

## print out model
pdf("data/tree.pdf");
for(i in 1:length(folds)) {
	print(modFit[[i]]$finalModel);
	plot(modFit[[i]]$finalModel, uniform = TRUE,
			 main = "Classification Tree");
	text(modFit[[i]]$finalModel, use.n = TRUE, all = TRUE, cex = .8);
}

## predict
pred = 0;
for(i in 1:length(folds)) {
	pred <- pred + predict(modFit[[1]],newdata=testing);
}
pred <- as.integer(pred / length(folds) + 0.5);
obs <- testing$Survived
confusionMatrix(obs, pred)

## pred <- as.integer(predict(modFit[[1]],newdata=testing) + 0.5)
## obs <- testing$Survived
## confusionMatrix(obs, pred)
