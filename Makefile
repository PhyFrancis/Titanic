all: tree

plot:
	Rscript plotPredictor.R
tree:
	Rscript decisionTree.R
resample:
	Rscript resample.R
