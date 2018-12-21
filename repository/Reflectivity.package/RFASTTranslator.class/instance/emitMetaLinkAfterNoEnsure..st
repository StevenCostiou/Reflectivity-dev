reflectivity
emitMetaLinkAfterNoEnsure: aNode

	aNode hasMetalinkAfter ifFalse: [ ^self ].
	aNode postambles do: [ :each | valueTranslator visitNode: each ].
	aNode afterHooks do: [ :each | effectTranslator visitNode: each ].