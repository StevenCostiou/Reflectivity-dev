updating
methodRemoved: aMethodRemoved
	| methodNode methodClass |
	methodNode := aMethodRemoved methodRemoved compiledMethod ast.
	methodClass := aMethodRemoved methodOrigin.
	methodClass isAnonymous
		ifTrue: [ ^ self ].
	self removeAllAnonymousNodesIn: methodNode fromAnonSubclassesOf: methodClass
	"	self reinstallPermaLinksForMethod: aMethodRemoved methodRemoved"