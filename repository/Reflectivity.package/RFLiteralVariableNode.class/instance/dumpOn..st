generation
dumpOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: ' value: '.
	self value printOn: aStream