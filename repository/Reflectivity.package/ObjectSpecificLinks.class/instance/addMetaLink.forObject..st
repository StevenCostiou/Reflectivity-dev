initialization
addMetaLink: aLink forObject: anObject
	(links at: anObject ifAbsentPut: WeakSet new) add: anObject.