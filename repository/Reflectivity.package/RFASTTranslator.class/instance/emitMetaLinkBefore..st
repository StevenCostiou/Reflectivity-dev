reflectivity
emitMetaLinkBefore: aNode
	aNode hasMetalinkBefore ifFalse: [ ^self ].
	aNode beforeHooks do: [ :hook | effectTranslator visitNode: hook ].