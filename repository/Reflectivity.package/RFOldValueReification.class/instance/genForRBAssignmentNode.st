generate
genForRBAssignmentNode
	| varNode |
	varNode := entity variable.
	
	varNode isGlobal ifTrue: [^RFLiteralVariableNode value: entity binding value]. 
	^RBVariableNode named: varNode name.