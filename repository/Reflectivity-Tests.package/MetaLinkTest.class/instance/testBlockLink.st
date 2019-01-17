tests - simple
testBlockLink
	| link |
	link := MetaLink new metaObject: [ 1 + 2 ].
	self assert: link metaObject value equals: 3.
	self assert: link selector equals: #value