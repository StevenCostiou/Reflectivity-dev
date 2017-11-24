updating
methodChanged: aMethodChanged
	| methodNode methodClass  |
	methodNode := aMethodChanged oldMethod compiledMethod ast.
	methodClass := aMethodChanged oldMethod methodClass.
	methodClass isAnonymous
		ifTrue: [ ^ self ].	
	self removeAllAnonymousNodesIn: methodNode fromAnonSubclassesOf: methodClass.
"	self reinstallPermaLinksForMethod: aMethodChanged newMethod"