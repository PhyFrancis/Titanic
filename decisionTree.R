source("resample.R") 

library(caret);

## train the model
modFit <- list();
for(i in 1:length(folds)) {
	modFit[[i]] <- train(Survived ~ Name + Sex + Pclass + SibSp + Parch + Fare + Embarked, 
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
alg <- 1; # alg 1: use mean value
          # alg 2: use majority vote
pred <- 0;
if(alg == 1) {
	for(i in 1:length(folds)) {
		pred <- pred + predict(modFit[[i]],newdata=testing);
	}
	pred <- as.integer(pred / length(folds) + 0.5)
} else if(alg == 2) {
	for(i in 1:length(folds)) {
		pred0 <- predict(modFit[[i]],newdata=testing);
		pred <- pred + as.integer(pred0 + 0.5);
	}
	pred <- as.integer(pred / length(folds) + 0.5)
} else {
	print("Algorithm not implemented");
}

## show confusion matrix
obs <- testing$Survived
confusionMatrix(obs, pred)
