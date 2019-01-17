tests - simple
testSimpleHaltLink
	| link |
	link := MetaLink new
		metaObject: Halt;
		selector: #now.
	self assert: link metaObject equals: Halt.
	self assert: link selector equals: #now