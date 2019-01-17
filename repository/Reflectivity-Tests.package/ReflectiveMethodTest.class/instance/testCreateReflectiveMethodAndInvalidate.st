tests - creation
testCreateReflectiveMethodAndInvalidate
	| compiledMethod reflectiveMethod |
	selector := #exampleMethod.
	compiledMethod := ReflectivityExamples >> #exampleMethod.
	reflectiveMethod := ReflectiveMethod on: compiledMethod.
	self assert: reflectiveMethod class equals: ReflectiveMethod.
	compiledMethod reflectiveMethod: reflectiveMethod.
	self assert: compiledMethod reflectiveMethod equals: reflectiveMethod.
	compiledMethod invalidate.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod.
	ReflectivityExamples >> #exampleMethod reflectiveMethod: nil