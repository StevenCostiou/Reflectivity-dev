nodes
uninstallNode: aNode forObject: anObject
	self removeNode: aNode forObject: anObject.
	(linkToNodesMapper findNodesForObject: anObject) 
		ifEmpty: [ anonSubclassesBuilder migrateObjectToOriginalClass: anObject ]