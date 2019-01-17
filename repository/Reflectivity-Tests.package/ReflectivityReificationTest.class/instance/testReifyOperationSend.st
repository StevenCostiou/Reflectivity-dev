tests - operations
testReifyOperationSend
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleMethod) ast body statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #before;
		arguments: #(operation).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod equals: 5.
	self assert: tag value equals: 5