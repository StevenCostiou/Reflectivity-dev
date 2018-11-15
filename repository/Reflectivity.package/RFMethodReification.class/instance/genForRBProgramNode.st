generate
genForRBProgramNode
	^RBMessageNode 
		receiver: (RBMessageNode receiver: (RFLiteralVariableNode value: entity)  selector: #methodNode)
		selector: #method