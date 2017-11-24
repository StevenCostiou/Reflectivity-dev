compiling
compileMethodFrom: aNode in: anAnonymousClass
	| selector source |
	selector := aNode methodNode selector.
	(anAnonymousClass methodDict at: selector ifAbsent: [ nil ]) ifNotNil: [ :compiledMethod | ^ compiledMethod ].
	source := aNode methodNode source.
	anAnonymousClass compile: source.
	^ anAnonymousClass >> selector