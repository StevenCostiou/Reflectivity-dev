tests - simple
testCotrolLink
	| link |
	link := MetaLink new
		metaObject: [ 1 + 2 ];
		control: #after.
	self assert: link metaObject value equals: 3.
	self assert: link selector equals: #value.
	self assert: link control equals: #after