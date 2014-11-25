source("import.R") 

outcome.name = "Survived"

for (head in colnames(tt)) {
  if(head != outcome.name) {

		qq <- ggplot(tt, aes(x = tt[,head])) + xlab(head) + geom_bar(aes(fill = factor(tt[,outcome.name])))
		print(qq)

		qq <- ggplot(tt, aes(x = tt[,head])) + xlab(head) + geom_bar(aes(fill = factor(tt[,outcome.name])), position = 'fill')
		print(qq)
  }
}
