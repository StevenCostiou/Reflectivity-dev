reflectivity
emitMetaLinkAfter: aNode
	aNode hasMetalinkAfter ifFalse: [ ^self ].
	aNode allAfterAreWeak ifTrue: [ ^self emitMetaLinkAfterNoEnsure: aNode ].
	
	methodBuilder blockReturnTop.
	methodBuilder jumpAheadTarget: #block.
	aNode postambles do: [:each | valueTranslator visitNode: each].
	aNode afterHooks do: [:each | valueTranslator visitNode: each].
	methodBuilder send: #ensure:.