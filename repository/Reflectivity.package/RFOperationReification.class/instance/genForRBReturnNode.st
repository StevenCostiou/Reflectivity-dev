generate
genForRBReturnNode
	^RBParser parseExpression: 'RFReturnOperation new
			context: thisContext;
			returnValue: RFReifyValueVar'