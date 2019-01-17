tests - method 
testReifyMethodSelector
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleMethod) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(selector).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod equals: 5.
	self assert: tag equals: #exampleMethod