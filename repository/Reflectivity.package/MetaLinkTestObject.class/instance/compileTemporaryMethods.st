as yet unclassified
compileTemporaryMethods
	self class compile: 'methodToBeRemoved ^nil'.
	self class compile: 'methodToBeModified ^nil'.
	self class compile: 'stubMethod ^nil'