nodes
removeNode: aNode forObject: anObject
	(self canRemoveMethodNodeContaining: aNode)
		ifTrue: [ anonSubclassesBuilder removeMethodNode: aNode fromObject: anObject ].
	linkToNodesMapper removeNode: aNode forObject: anObject