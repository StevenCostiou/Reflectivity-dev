tests - creation
testInvalidate
	selector := #exampleMethod.
	(ReflectivityExamples >> #exampleMethod) createTwin.
	(ReflectivityExamples >> #exampleMethod) invalidate.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod.
	ReflectivityExamples >> #exampleMethod reflectiveMethod: nil