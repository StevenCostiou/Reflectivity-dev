generate
genForRBVariableNode
	entity isInstance ifTrue: [  
		^RBParser parseExpression: ('RFSlotRead new 
			object: self;
			variableName: #{1}.' format: {entity name})].
		
	entity isTemp ifTrue: [
		^RBParser parseExpression: ('RFTempRead new 
			context: thisContext;
			variableName: #{1}.' format: {entity name})].
	
	entity isGlobal ifTrue: [ | ast |	
			ast := RBParser parseExpression: ('RFGlobalRead new
				environment: #toReplace;
				variableName: #{1}.' format: {entity name}).
			ast messages first arguments: {(RFLiteralVariableNode value: entity binding scope environment)}.

			^ast. 
		].
		
	self error: 'not supported'

