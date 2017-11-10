nodes
compileMethodNodeFor: aNode in: anAnonymousClass
	| methodNode |
	(anAnonymousClass methodDict at: aNode methodNode selector ifAbsent: [ nil ])
		ifNotNil: [ :compiledMethod | ^ compiledMethod ast ].
	methodNode := aNode methodNode.
	anAnonymousClass compile: methodNode source.
	^ (anAnonymousClass >> methodNode selector) ast