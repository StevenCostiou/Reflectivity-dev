visitor-double dispatching
visitReturnNode: aReturnNode 

	valueTranslator visitNode: aReturnNode value.
	self emitPreamble: aReturnNode.
	self emitMetaLinkBefore: aReturnNode.
	aReturnNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aReturnNode ]
		ifFalse: [ methodBuilder returnTop ].

		
