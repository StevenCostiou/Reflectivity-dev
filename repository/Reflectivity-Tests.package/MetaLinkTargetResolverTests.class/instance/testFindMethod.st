tests
testFindMethod
	| ast  |
	ast := (ReflectivityExamples >> #exampleMethod) ast.
	self assert: (MetalinkTargetResolver methodNamed: #exampleMethod for: ReflectivityExamples) == ast.
	self assert: (MetalinkTargetResolver methodNamed: #exampleMethod for: ReflectivityExamples new) == ast