tests - creation
testInvalidateWithLinkCount
	selector := #exampleMethod.
	(ReflectivityExamples >> #exampleMethod) createTwin.
	(ReflectivityExamples >> #exampleMethod) invalidate.
	ReflectivityExamples >> #exampleMethod linkCount: 1.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleMethod) reflectiveMethod isNil.
	ReflectivityExamples >> #exampleMethod reflectiveMethod: nil