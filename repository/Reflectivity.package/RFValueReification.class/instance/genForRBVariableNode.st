generate
genForRBVariableNode
	entity binding
		ifNotNil: [ entity isGlobal
				ifTrue: [ ^ RFLiteralVariableNode value: entity binding value ] ].
	^ RBVariableNode named: entity name