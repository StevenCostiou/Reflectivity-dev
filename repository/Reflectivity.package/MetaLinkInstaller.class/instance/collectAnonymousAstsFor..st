nodes
collectAnonymousAstsFor: aNode
	"Collects all ast nodes that are copies of aNode in anonymous subclasses
	of aNode class."

	| methodNode selector methodClass methods |
	methodNode := aNode methodNode.
	selector := methodNode selector.
	methodClass := methodNode methodClass.
	methods := anonSubclassesBuilder compiledMethodsOfSelector: selector inAnonSubClassesOf: methodClass.
	^ methods
		collect: [ :method | 
			| anonMethodNode |
			anonMethodNode := method ast.
			aNode isMethod
				ifTrue: [ anonMethodNode ]
				ifFalse: [ self findSubNode: aNode in: anonMethodNode ] ]