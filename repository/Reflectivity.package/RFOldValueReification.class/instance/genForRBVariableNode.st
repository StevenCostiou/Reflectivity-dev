generate
genForRBVariableNode
	"same as #value for variableNodes"

	(entity binding ifNotNil: [ :b | b isGlobal ] ifNil: [ false ])
		ifTrue: [ ^ RFLiteralVariableNode value: entity binding value ].
	^ RBVariableNode named: entity name