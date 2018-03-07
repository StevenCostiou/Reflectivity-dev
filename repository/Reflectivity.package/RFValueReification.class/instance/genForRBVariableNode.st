generate
genForRBVariableNode
	entity isGlobal ifTrue: [^RFLiteralVariableNode value: entity binding value]. 
	^RBVariableNode named: entity name.