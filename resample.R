source("import.R") 

folds <- createResample(y = training$Survived,
												times = 10,
												list = TRUE)
