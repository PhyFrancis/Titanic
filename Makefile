all: tree

plot:
	Rscript plotPredictor.R
tree:
	Rscript decisionTree.R
submit:
	Rscript submit.R
