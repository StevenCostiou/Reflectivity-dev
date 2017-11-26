nodes
copyNode: aNode inClass: anAnonymousClass
	| methodNode node |
	methodNode := aNode methodNode.
	node := self compileMethodNodeFor: aNode in: anAnonymousClass.
	self linkAllFromNode: methodNode into: node.
	aNode = methodNode
		ifTrue: [ ^ node ].
	^ node allChildren
		detect:
			[ :n | n = aNode and: [ n start = aNode start and: [ n stop = aNode stop ] ] ]