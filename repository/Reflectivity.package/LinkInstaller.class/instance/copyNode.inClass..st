nodes
copyNode: aNode inClass: anAnonymousClass
	"4 may 2017: only methods nodes are considered."

	| methodNode node |
	methodNode := aNode methodNode.
	anAnonymousClass compile: methodNode source.
	node := (anAnonymousClass >> methodNode selector) ast.
	self linkAllFromNode: methodNode into: node.
	node = methodNode
		ifTrue: [ ^ node ].
	self
		flag:
			'Should return the copied node and not the method node (except if aNode was a method node)'.
	self flag: 'Should manage the copy of all links for all nodes in the method'.
	^ node allChildren detect: [ :n | n = aNode ]