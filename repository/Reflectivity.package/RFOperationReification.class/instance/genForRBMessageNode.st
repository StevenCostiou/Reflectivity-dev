generate
genForRBMessageNode
	^RBParser parseExpression: ('RFMessageOperation 
			receiver: RFReceiverReificationVar 
			selector: #{1} 
			arguments: RFArgumentsReificationVar.' format: {entity selector})
