tests - method - body
testReifyMethodBodyArgsBefore
	| sequenceNode instance |
	sequenceNode := (ReflectivityExamples >> #exampleWithArg:) ast body.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #before;
		arguments: #(arguments).
	sequenceNode link: link.
	self assert: sequenceNode isSequence.
	self assert: sequenceNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleWithArg:) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: (instance exampleWithArg: 3) equals: 5.
	self assert: tag equals: #(3)