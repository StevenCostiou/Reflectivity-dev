tests - before
testBeforeSendInCascade
	| sendNode |
	sendNode := (ReflectivityExamples >> #exampleCascade) ast statements first value messages first.
	self assert: sendNode isMessage.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	sendNode link: link.
	self assert: sendNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleCascade equals: 1.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: CompiledMethod.