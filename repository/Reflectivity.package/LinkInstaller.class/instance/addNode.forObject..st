nodes
addNode: aNode forObject: anObject
	(nodesForObjects at: anObject ifAbsentPut: [ WeakSet new ]) add: aNode.
	^ aNode