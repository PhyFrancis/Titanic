library(caret)

goal <- "Survived"
df <- read.csv("data/train.csv")

## imputing/dropping data 
df$Cabin <- NULL ## too many missing in Cabin
munge_Name <- as.character(df$Name)
t <- c("Mrs","Miss","Mr","Mz")
for(i in 1:length(df$Name)) {
	for(title in t) {
		if(grepl(title,munge_Name[i])) {
			munge_Name[i] <- title
			break
		}
	}
	if(!(munge_Name[i] %in% t)) munge_Name[i] <- "None"
}
df$Name <- factor(munge_Name)

## partition data
set.seed(123432)
inTrain <- createDataPartition(df[,goal],
                               p = 0.8,
                               list = FALSE)
training <- df[inTrain,]
testing <- df[-inTrain,]
