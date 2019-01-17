tests - before
testBeforeVariableSelf
	| variableNode |
	variableNode := (ReflectivityExamples >> #exampleSelf) ast statements
		first.
	self assert: variableNode isVariable.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	variableNode link: link.
	self assert: variableNode hasMetalinkBefore.
	self
		assert: (ReflectivityExamples >> #exampleSelf) class
		equals: ReflectiveMethod.
	self assert: tag isNil.
	self
		assert: ReflectivityExamples new exampleSelf class
		equals: ReflectivityExamples.
	self assert: tag equals: 'yes'.
	self
		assert: (ReflectivityExamples >> #exampleSelf) class
		equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleSelf) isQuick