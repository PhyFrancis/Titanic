library(caret)

goal = "Survived"
df = read.csv("data/train.csv")

## set.seed(31415)
set.seed(123432)
inTrain <- createDataPartition(df[,goal],
                               p = 0.75,
                               list = FALSE)
training <- df[inTrain,]
testing <- df[-inTrain,]

## imputing data 
#preProcess(training$Age, method="BoxCox")
