generate
genForRBVariableNode
	(entity binding ifNotNil: [ :b | b isGlobal ] ifNil: [ false ])
		ifTrue: [ ^ RFLiteralVariableNode value: entity binding value ].
	^ RBVariableNode named: entity name