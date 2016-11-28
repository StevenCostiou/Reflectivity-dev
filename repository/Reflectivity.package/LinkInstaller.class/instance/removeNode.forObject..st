nodes
removeNode: aNode forObject: anObject
	(nodesForObjects at: anObject ifAbsent: [ ^ self ]) remove: aNode