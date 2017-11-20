nodes
copyNode: aNode inClass: anAnonymousClass
	"4 may 2017: only methods nodes are considered."

	| methodNode node superSuperNode |
	methodNode := aNode methodNode.
	node := self compileMethodNodeFor: aNode in: anAnonymousClass.
	"superSuperNode := methodNode allChildren detect: [ :n | n isSuper ].
	(node allChildren select: [ :c | c isSuper ])
		do: [ :superNode | superNode binding: superSuperNode binding ]."
	self linkAllFromNode: methodNode into: node.
	aNode = methodNode
		ifTrue: [ ^ node ].
	^ node allChildren detect: [ :n | n = aNode ]