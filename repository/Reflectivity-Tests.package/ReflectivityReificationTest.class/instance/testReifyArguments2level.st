tests - sends
testReifyArguments2level
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleSendTwoArgs) ast body statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(arguments);
		level: 0.
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleSendTwoArgs) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self deny: (Processor activeProcess isMeta).
	self assert: instance exampleSendTwoArgs equals: #(1 2).
	self deny: (Processor activeProcess isMeta).
	self assert: tag equals: #(1 2)