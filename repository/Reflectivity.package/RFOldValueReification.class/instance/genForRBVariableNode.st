generate
genForRBVariableNode
	"same as #value for variableNodes"
	entity isGlobal ifTrue: [^RFLiteralVariableNode value: entity binding value]. 
	^RBVariableNode named: entity name.