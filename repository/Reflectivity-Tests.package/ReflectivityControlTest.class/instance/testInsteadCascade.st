tests - instead
testInsteadCascade
	| cascadeNode |
	cascadeNode := (ReflectivityExamples >> #exampleCascade) ast statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec;
		control: #instead.
	cascadeNode link: link.
	self assert: cascadeNode hasMetalinkInstead.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleCascade equals: self.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: CompiledMethod.