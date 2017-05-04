nodes
removeNode: aNode forObject: anObject
	anObject class removeSelector: aNode selector.
	(nodesForObjects at: anObject ifAbsent: [ ^ self ]) remove: aNode