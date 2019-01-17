tests - creation
testInvalidateNoJit
	(ReflectivityExamples class >> #exampleMethodWithMetaLinkOptionsViaClass) createTwin.
	(ReflectivityExamples class >> #exampleMethodWithMetaLinkOptionsViaClass) invalidate.
	self assert: (ReflectivityExamples class >> #exampleMethodWithMetaLinkOptionsViaClass) class equals: CompiledMethod.
	self assert: ReflectivityExamples exampleMethodWithMetaLinkOptionsViaClass equals: 5.
	self assert: (ReflectivityExamples class >> #exampleMethodWithMetaLinkOptionsViaClass) class equals: CompiledMethod.
	ReflectivityExamples class >> #exampleMethodWithMetaLinkOptionsViaClass reflectiveMethod: nil.
	ReflectivityExamples class recompile: #exampleMethodWithMetaLinkOptionsViaClass