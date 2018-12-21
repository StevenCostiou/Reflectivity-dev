generate
genForRBAssignmentNode
	entity variable isTemp ifTrue: [  
		^RBParser parseExpression: ('RFTempWrite new
			assignedValue: RFNewValueReificationVar; 
			context: thisContext;
			variableName: #{1}.' format: {entity variable name})].
		
	entity variable isInstance ifTrue: [  
		^RBParser parseExpression: ('RFSlotWrite new
			assignedValue: RFNewValueReificationVar; 
			object: self;
			variableName: #{1}.' format: {entity variable name})].

	entity variable isGlobal ifTrue: [ | ast |	
		ast := RBParser parseExpression: ('RFGlobalWrite new
			assignedValue: RFNewValueReificationVar;
			environment: #toReplace;
			variableName: #{1}.' format: {entity variable name}).
		ast messages second arguments: {(RFLiteralVariableNode value: entity variable binding scope environment)}.
		^ast].
	self error: 'not supported'