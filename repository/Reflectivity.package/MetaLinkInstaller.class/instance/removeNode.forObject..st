nodes
removeNode: aNode forObject: anObject
	(self canRemoveMethodNodeContaining: aNode)
		ifTrue: [ self removeSuperJumpsFor: aNode.
			anonSubclassesBuilder removeMethodNode: aNode fromObject: anObject ].
	linkToNodesMapper removeNode: aNode forObject: anObject