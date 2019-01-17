tests - misc
testReifyArrayOperationAfter
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleArray) ast body statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(operation).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleArray) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleArray equals: #(3).
	self assert: tag value equals: #(3)