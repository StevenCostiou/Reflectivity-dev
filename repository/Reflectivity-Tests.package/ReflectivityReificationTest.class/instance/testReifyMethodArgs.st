tests - method 
testReifyMethodArgs
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleWithArg:) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleWithArg:) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: (instance exampleWithArg: 3) equals: 5.
	self assert: tag equals: #(3)