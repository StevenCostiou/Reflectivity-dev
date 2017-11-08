updating
methodChanged: aMethodChanged
	| methodNode methodClass anonClasses |
	methodNode := aMethodChanged oldMethod compiledMethod ast.
	methodClass := aMethodChanged oldMethod methodClass.
	methodClass isAnonymous
		ifTrue: [ ^ self ].
	anonClasses := anonSubclassesRegistry at: methodClass ifAbsent: [ ^ self ].
	self removeAllAnonymousNodesIn: methodNode fromClasses: anonClasses