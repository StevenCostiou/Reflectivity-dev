updating
methodRemoved: aMethodRemoved
	| methodNode methodClass anonClasses |
	methodNode := aMethodRemoved methodRemoved compiledMethod ast.
	methodClass := aMethodRemoved methodOrigin.
	methodClass isAnonymous
		ifTrue: [ ^ self ].
	anonClasses := anonSubclassesRegistry at: methodClass ifAbsent: [ ^ self ].
	self removeAllAnonymousNodesIn: methodNode fromClasses: anonClasses