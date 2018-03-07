generate
genForInstanceVariableSlot
	"entity in this case is the binding of the instance variable"

	^ RBMessageNode
		receiver: (RFLiteralVariableNode value: entity)
		selector: #read:
		arguments: {(RBVariableNode named: 'self')}