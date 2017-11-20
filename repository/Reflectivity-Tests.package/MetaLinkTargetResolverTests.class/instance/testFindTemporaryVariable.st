tests
testFindTemporaryVariable
	| temp |
	temp := (ReflectivityExamples >> #exampleIfTrueIfFalse) temporaryVariableNamed: #t.	
	self assert: (MetalinkTargetResolver temporaryNamed: #t inMethod: #exampleIfTrueIfFalse for: ReflectivityExamples) = temp.
	self assert: (MetalinkTargetResolver temporaryNamed: #t inMethod: #exampleIfTrueIfFalse for: ReflectivityExamples new) = temp.