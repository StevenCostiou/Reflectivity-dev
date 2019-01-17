tests - sends
testReifySendArguments2
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleSendTwoArgs) ast body
		statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleSendTwoArgs) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleSendTwoArgs equals: #(1 2).
	self assert: tag equals: #(1 2)