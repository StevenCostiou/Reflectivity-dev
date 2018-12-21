visitor-double dispatching
visitVariableNode: aVariableNode
	
	| binding |
	
	self emitPreamble: aVariableNode.
	self emitMetaLinkBefore: aVariableNode.
	
	aVariableNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aVariableNode ].
		
	"when visiting a variable for effect, we could push it and then pop it, but we do nothing"
	binding := aVariableNode binding.
	(binding isLiteralVariable or: [ binding isUndeclared ])
		ifTrue: [ methodBuilder addLiteral: binding assoc ].
		
	self emitMetaLinkAfterNoEnsure: aVariableNode.
