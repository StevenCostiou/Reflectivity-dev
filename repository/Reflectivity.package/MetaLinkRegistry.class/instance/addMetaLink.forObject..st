adding
addMetaLink: aLink forObject: anObject
	(links at: aLink ifAbsentPut: WeakSet new) add: anObject