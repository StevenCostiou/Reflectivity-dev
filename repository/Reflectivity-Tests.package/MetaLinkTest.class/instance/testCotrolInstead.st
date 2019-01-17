tests - simple
testCotrolInstead
	| link |
	link := MetaLink new
		metaObject: [ 1 + 2 ];
		control: #instead.
	self assert: link metaObject value equals: 3.
	self assert: link selector equals: #value.
	self assert: link control equals: #instead.
	self deny: (ReflectivityExamples >> #exampleMethod) ast hasMetalinkInstead