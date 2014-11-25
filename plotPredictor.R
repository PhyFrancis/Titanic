source("import.R") 

## featurePlot(x = tt[,c("Sex","Age","Parch")],
##             y = tt$Survived,
##             plot = "pairs")

outcome.name = "Survived"

for (head in colnames(tt)) {
  if(head != outcome.name) {

    counts <- table(tt[,outcome.name], tt[,head])


		qq <- ggplot(tt, aes(x = tt[,head])) + xlab(head) + geom_bar(aes(fill = factor(tt[,outcome.name])))
		print(qq)

		qq <- ggplot(tt, aes(x = tt[,head])) + xlab(head) + geom_bar(aes(fill = factor(tt[,outcome.name])), position = 'fill')
		print(qq)
  }
}

## counts <- table(mtcars$vs, mtcars$gear)
## barplot(counts, main="Car Distribution by Gears and VS",
##         xlab="Number of Gears", col=c("darkblue","red"),
##         legend = rownames(counts)) 

## plot(Age,Survived,data=tt)
