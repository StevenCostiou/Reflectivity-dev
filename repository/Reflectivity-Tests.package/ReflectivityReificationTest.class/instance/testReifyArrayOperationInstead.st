tests - misc
testReifyArrayOperationInstead
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleArray) ast body statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #instead;
		arguments: #(operation).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self
		assert: (ReflectivityExamples >> #exampleArray) class
		equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleArray equals: self.
	self assert: tag value equals: #(3)