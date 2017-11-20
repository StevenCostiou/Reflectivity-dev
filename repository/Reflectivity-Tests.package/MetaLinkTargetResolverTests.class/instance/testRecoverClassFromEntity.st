tests
testRecoverClassFromEntity
	self assert: (MetalinkTargetResolver classFor: ReflectivityExamples new) == ReflectivityExamples.
	self assert: (MetalinkTargetResolver classFor: ReflectivityExamples) == ReflectivityExamples