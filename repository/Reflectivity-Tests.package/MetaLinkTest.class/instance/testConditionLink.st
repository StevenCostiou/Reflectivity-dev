tests - simple
testConditionLink
	| link |
	link := MetaLink new
		metaObject: [ 1 + 2 ];
		condition: true.
	self assert: link metaObject value equals: 3.
	self assert: link selector equals: #value.
	self assert: link condition.
	self assert: link hasCondition