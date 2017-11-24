mapping
addNode: aNode forObject: anObject
	(nodesForObjects at: anObject ifAbsentPut: [ WeakSet new ]) add: aNode.
	(objectsForNodes at: aNode ifAbsentPut: [ WeakSet new ]) add: anObject.
	^ aNode