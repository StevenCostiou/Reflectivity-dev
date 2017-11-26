updating
methodRemoved: aMethodRemoved
	| methodNode methodClass |
	methodNode := aMethodRemoved methodRemoved compiledMethod ast.
	self removePermaLinksNodesReferencesFor: methodNode.
	methodClass := aMethodRemoved methodOrigin.
	methodClass isAnonymous
		ifTrue: [ ^ self ].	
	self removeAllAnonymousNodesIn: methodNode fromAnonSubclassesOf: methodClass.
