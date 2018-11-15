generate
genForRBMethodNode
	| ast |
	ast := RBParser parseExpression: 'RFMethodOperation new
			receiver: self;
			method: #toReplace;
			arguments: RFArgumentsReificationVar.'.	
	
	ast messages second arguments: {(RFLiteralVariableNode value: entity methodNode method)}.
	^ast.