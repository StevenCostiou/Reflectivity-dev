tests - after
testAfterCascade
	| cascadeNode |
	cascadeNode := (ReflectivityExamples >> #exampleCascade) ast statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec;
		control: #after.
	cascadeNode link: link.
	self assert: cascadeNode hasMetalinkAfter.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleCascade equals: 1.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: CompiledMethod.