initialization
addMetaLink: aLink forObject: anObject
	(links at: anObject ifAbsentPut: Set new) add: anObject.