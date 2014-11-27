library(caret)

goal <- "Survived"
df <- read.csv("data/train.csv")

## imputing/dropping data 
df$Cabin <- NULL ## too many missing in Cabin
# for(i in 1:length(df$Name)) {
# 	for(title in c("Mr","Mrs","Miss")) {
# 		if(grepl(title,df$Name[i])) {
# 			df$Name[i] <- title;
# 			break
# 		}
# 	}
# }
# summary(df$Name)

## partition data
set.seed(123432)
inTrain <- createDataPartition(df[,goal],
                               p = 0.8,
                               list = FALSE)
training <- df[inTrain,]
testing <- df[-inTrain,]
