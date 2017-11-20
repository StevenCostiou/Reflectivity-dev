tests
testFindClassVariable
	| classVar |
	classVar := ReflectivityExamples classVariableNamed: 'singleton'.
	self assert: (MetalinkTargetResolver classVariableNamed: 'singleton' for: ReflectivityExamples) == classVar.
	self assert: (MetalinkTargetResolver classVariableNamed: 'singleton' for: ReflectivityExamples new) == classVar