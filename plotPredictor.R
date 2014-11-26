source("import.R") 

library(caret);
library(Amelia);

outcome.name = "Survived"

sink("result/summary.txt")
summary(df);

pdf("result/Rplot.pdf")
missmap(df);
for (head in colnames(df)) {
  if(head != outcome.name) {

		qq <- ggplot(df, aes(x = df[,head])) + xlab(head) + geom_bar(aes(fill = factor(df[,outcome.name])))
		print(qq)

		qq <- ggplot(df, aes(x = df[,head])) + xlab(head) + geom_bar(aes(fill = factor(df[,outcome.name])), position = 'fill')
		print(qq)
  }
}

exclude <- c("Name")
heads <- colnames(df)
for (head1 in heads) {
	if(head1 == outcome.name | head1 %in% exclude) next
	for (head2 in heads) {
		if(head2 == outcome.name | head2 %in% exclude | head2 == head1) next
		if(match(head1,heads) <= match(head2,heads)) next
		print(qplot(df[,head1],df[,head2],colour=Survived,data=df) + xlab(head1) + ylab(head2))
	}
}
