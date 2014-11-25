source("import.R") 

## featurePlot(x = tt[,c("Sex","Age","Parch")],
##             y = tt$Survived,
##             plot = "pairs")

outcome.name = "Survived"

for (head in colnames(tt)) {
  if(head != outcome.name) {

    counts <- table(tt[,outcome.name], tt[,head])
    barplot(counts,xlab=head)

    counts_prop = prop.table(counts, margin=2)
    barplot(counts_prop)
  }
}

## counts <- table(mtcars$vs, mtcars$gear)
## barplot(counts, main="Car Distribution by Gears and VS",
##         xlab="Number of Gears", col=c("darkblue","red"),
##         legend = rownames(counts)) 

## plot(Age,Survived,data=tt)
