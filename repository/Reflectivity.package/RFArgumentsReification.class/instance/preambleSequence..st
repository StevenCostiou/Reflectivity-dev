preamble
preambleSequence: aNode
	| preamble arguments |
	preamble := OrderedCollection new.
	arguments := aNode parent argumentNames collect: [ :name | RBTemporaryNode named: name].
	preamble addAll: (RBArrayNode statements: arguments).
	preamble add: (RFStorePopIntoTempNode named: self varName).
	^ preamble 