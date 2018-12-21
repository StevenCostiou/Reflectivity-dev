preamble
preambleForArray: aNode
	| preamble arguments |
	preamble := OrderedCollection new.
	arguments := OrderedCollection new.

	(1 to: aNode size) reverseWithIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			preamble add:  (RFStorePopIntoTempNode named: name).
	].
	
	self flag: #TBD. "for #instead we do not need to build the stack up again as the array creation bytecode is missing"
	(1 to: aNode size) withIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			arguments add:  (RBTemporaryNode named: name).
	].
	preamble addAll: (RBArrayNode statements: arguments).
	preamble add: (RFStorePopIntoTempNode named: self varName).
	preamble addAll: arguments.
	^ preamble 
	