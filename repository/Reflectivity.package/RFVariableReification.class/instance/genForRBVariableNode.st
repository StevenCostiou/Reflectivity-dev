generate
genForRBVariableNode
	
	entity isTemp ifTrue: [ ^self error: 'Temps can not be reified yet' ]. 
	^RFLiteralVariableNode value: entity binding variable