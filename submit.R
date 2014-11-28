# source("import.R") 

## train the model using whole set of data
# modFit <- train(Survived ~ Name + Sex + Pclass + SibSp + Parch + Fare + Embarked, 
# 								data = df,
#                 method = "rf",
# 								prox = TRUE)

## load test set & preprocessing
obj <- read.csv("data/test.csv")
obj$Cabin <- NULL 
munge_Name <- as.character(obj$Name)
t <- c("Mrs","Miss","Mr","Mz")
for(i in 1:length(obj$Name)) {
	for(title in t) {
		if(grepl(title,munge_Name[i])) {
			munge_Name[i] <- title
			break
		}
	}
	if(!(munge_Name[i] %in% t)) munge_Name[i] <- "None"
}
obj$Name <- factor(munge_Name)

## predict
pred <- as.integer(predict(modFit,newdata = obj) + 0.5)

## write to file
out <- data.frame(obj$PassengerId,pred)
write.csv(out,file="result/randomForest.csv",quote=FALSE,row.names=FALSE)
