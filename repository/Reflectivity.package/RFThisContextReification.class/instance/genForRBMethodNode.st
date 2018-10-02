generate
genForRBMethodNode
	"when in after the call to the meta is wrapped in a block"
	^link control = #after
		ifTrue: [ RBMessageNode receiver: (RBThisContextNode named: #thisContext) selector: #outerContext]
		ifFalse: [ RBThisContextNode named: #thisContext ]
