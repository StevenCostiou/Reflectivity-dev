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
	
	entity isGlobal ifTrue: [
			^RBParser parseExpression: ('RFGlobalRead new 
			variableName: #{1}.' format: {entity name})].
		
	self error: 'not supported'

