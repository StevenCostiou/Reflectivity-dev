tests - operations
testReifyGlobalOperation
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleGlobalRead) ast body statements last value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleGlobalRead equals: GlobalForTesting.
	self assert: tag class == RFGlobalRead.
	self assert: tag value equals: GlobalForTesting