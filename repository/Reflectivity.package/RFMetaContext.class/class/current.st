accessing
current 
	ActiveMetaContext value ifNil:[ActiveMetaContext value: self basicNew initialize].
	^ActiveMetaContext value