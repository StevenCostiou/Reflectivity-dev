generate
genForRBBlockNode
	"we just compile the block again"
	| blockNode |
	
	blockNode := RBParser parseExpression: entity formattedCode.
	^RBMessageNode 
		receiver: (RBVariableNode named: #RFBlockOperation)
		selector: #block: 
		arguments: {blockNode} 