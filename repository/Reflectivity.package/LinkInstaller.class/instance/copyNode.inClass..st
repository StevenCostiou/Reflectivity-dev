nodes
copyNode: aNode inClass: anAnonymousClass
	"4 may 2017: only methods nodes are considered."

	| methodNode node |
	methodNode := aNode methodNode.
	node := self compileMethodNodeFor: aNode in: anAnonymousClass.
	self linkAllFromNode: methodNode into: node.
	aNode = methodNode
		ifTrue: [ ^ node ].
	^ node allChildren detect: [ :n | n = aNode ]