nodes
collectAnonymousAstsFor: aNode
	"Collects all ast nodes that are copies of aNode in anonymous subclasses
	of aNode class."

	| methodNode class anonSubClasses |
	methodNode := aNode methodNode.
	class := methodNode methodClass.
	class isAnonymous
		ifTrue: [ ^ #() ].
	anonSubClasses := anonSubclassesRegistry at: class ifAbsent: [ ^ #() ].
	^ (anonSubClasses select: [ :ac | ac selectors includes: methodNode selector ])
		collect: [ :ac | 
			| anonMethodNode |
			anonMethodNode := (ac compiledMethodAt: methodNode selector) ast.
			aNode isMethod
				ifTrue: [ anonMethodNode ]
				ifFalse: [ self findSubNode: aNode in: anonMethodNode ] ]