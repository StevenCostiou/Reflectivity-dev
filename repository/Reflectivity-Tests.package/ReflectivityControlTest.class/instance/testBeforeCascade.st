tests - before
testBeforeCascade
	| cascadeNode |
	cascadeNode := (ReflectivityExamples >> #exampleCascade) ast statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	cascadeNode link: link.
	self assert: cascadeNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleCascade equals: 1.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: CompiledMethod.