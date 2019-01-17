tests - operations
testReifySlotOperationInstead
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleIvarRead) ast body statements last value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #instead;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleIvarRead equals: self.
	self assert: tag class == RFSlotRead.
	self deny: tag  equals: 'ivar'.
	self assert: tag value equals: 33.