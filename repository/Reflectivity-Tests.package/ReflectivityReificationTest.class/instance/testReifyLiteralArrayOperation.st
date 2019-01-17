tests - misc
testReifyLiteralArrayOperation
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleLiteralArray) ast body statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(operation).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self
		assert: (ReflectivityExamples >> #exampleLiteralArray) class
		equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleLiteralArray equals: #(1).
	self assert: tag value equals: #(1)