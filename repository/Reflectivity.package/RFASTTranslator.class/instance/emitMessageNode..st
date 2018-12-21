visitor-double dispatching
emitMessageNode: aMessageNode

	(aMessageNode isCascaded and: [(aMessageNode hasProperty: #hook) not])
		ifFalse: [ valueTranslator visitNode: aMessageNode receiver ].
	aMessageNode arguments do: [ :each | valueTranslator visitNode: each ].
	self emitPreamble: aMessageNode.
	self emitMetaLinkBefore: aMessageNode.
	aMessageNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aMessageNode ]
		ifFalse: [ 
			aMessageNode isSuperSend
				ifTrue: [ methodBuilder send: aMessageNode selector toSuperOf: self compilationContext getClass ]
				ifFalse: [ methodBuilder send: aMessageNode selector ] ].
	self emitMetaLinkAfterNoEnsure: aMessageNode.