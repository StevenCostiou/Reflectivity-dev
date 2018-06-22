nodes
copyNode: aNode inClass: anAnonymousClass
	| methodNode node |
	methodNode := aNode methodNode.
	node := self compileMethodNodeFor: aNode in: anAnonymousClass.
	self linkAllFromNode: methodNode into: node.
	self installSuperJumpLinksInMethodNode: node.
	aNode = methodNode
		ifTrue: [ ^ node ].
	^ node allChildren detect: [ :n | n isEquivalentTo: aNode ]