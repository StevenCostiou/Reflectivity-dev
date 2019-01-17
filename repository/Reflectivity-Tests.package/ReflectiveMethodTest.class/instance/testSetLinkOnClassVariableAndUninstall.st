tests - variables
testSetLinkOnClassVariableAndUninstall
	| classVar link |
	selector := #exampleClassVarRead.
	link := MetaLink new.
	classVar := (ReflectivityExamples classVariableNamed: #ClassVar).
	classVar link: link.

	self assert: (classVar links includes: link).
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class equals: ReflectiveMethod.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) linkCount equals: 1.
	
	link uninstall.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class equals: CompiledMethod.
