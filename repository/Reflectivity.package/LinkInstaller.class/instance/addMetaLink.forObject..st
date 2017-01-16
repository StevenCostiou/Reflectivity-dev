links
addMetaLink: aLink forObject: anObject
	(links at: aLink ifAbsentPut: WeakSet new) addIfNotPresent: anObject.