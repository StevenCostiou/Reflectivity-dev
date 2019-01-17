tests
testTwoLinksUnstallOne
	| node instance |
	node := (ReflectivityExamples >> #exampleWithArg:) ast.
	link := MetaLink new
		metaObject: self;
		selector: #increase.
	link2 := MetaLink new
		metaObject: self;
		selector: #increase.
	node link: link.
	node link: link2.
	self
		assert: (ReflectivityExamples >> #exampleWithArg:) class
		equals: ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: (instance exampleWithArg: 3) equals: 5.
	self assert: count equals: 2.
	node removeLink: link2.
	self assert: (instance exampleWithArg: 3) equals: 5.
	self assert: count equals: 3