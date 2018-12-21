evaluation
wrapperNeeded
	ast hasMetalink ifFalse: [ ^false ].
	compiledMethod isRealPrimitive ifTrue: [ ^true ].
	ast hasMetalinkAfter ifTrue: [ ^true ].
	^false.