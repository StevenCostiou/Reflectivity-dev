mapping
removeNode: aNode forObject: anObject
	"I am just a helper object, if someone asks me to remove a node or an object
	that i don't know, i don't raise any errors"
	(nodesForObjects at: anObject) remove: aNode ifAbsent:[].
	(objectsForNodes at: aNode) remove: anObject ifAbsent:[]