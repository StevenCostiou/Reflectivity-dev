tests - before
testBeforeVariable
	| variableNode |
	variableNode := (ReflectivityExamples >> #exampleGlobalRead) ast statements first value.
	self assert: variableNode isVariable.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	variableNode link: link.
	self assert: variableNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleGlobalRead equals: GlobalForTesting.
	self assert: tag equals: 'yes'.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleGlobalRead) isQuick