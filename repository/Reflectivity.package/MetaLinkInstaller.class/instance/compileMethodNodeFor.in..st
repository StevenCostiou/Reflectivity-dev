nodes
compileMethodNodeFor: aNode in: anAnonymousClass
	^ (anonSubclassesBuilder compileMethodFrom: aNode in: anAnonymousClass) ast