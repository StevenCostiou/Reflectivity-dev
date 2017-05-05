links
collectAnonymousAstsFor: aNode
	"Collects all ast nodes that are copies of aNode in anonymous subclasses
	of aNode class."

	| class anonSubClasses |
	class := aNode methodNode methodClass.
	class isAnonymous
		ifTrue: [ ^ #() ].
	anonSubClasses := anonSubclassesRegistry at: class ifAbsent: [ ^ #() ].
	^ (anonSubClasses select: [ :ac | ac methodDictionary keys includes: aNode selector ])
		collect: [ :ac | (ac compiledMethodAt: aNode selector) ast ]