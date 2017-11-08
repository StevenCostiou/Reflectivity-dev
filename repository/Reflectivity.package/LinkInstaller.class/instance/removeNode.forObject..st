nodes
removeNode: aNode forObject: anObject
	(self canRemoveMethodNodeContaining: aNode)
		ifTrue: [ anObject class removeSelector: aNode methodNode selector ].
	(nodesForObjects at: anObject ifAbsent: [ ^ self ]) remove: aNode