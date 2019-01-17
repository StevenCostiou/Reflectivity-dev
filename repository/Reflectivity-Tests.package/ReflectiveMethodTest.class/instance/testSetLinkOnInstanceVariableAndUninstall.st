tests - variables
testSetLinkOnInstanceVariableAndUninstall
	| ivar link |
	selector := #exampleIvarRead.
	link := MetaLink new.
	ivar := ReflectivityExamples slotNamed: #ivar.
	ivar link: link.
	self assert: (ivar links includes: link).
	self assert: (ReflectivityExamples >> #exampleIvarRead) class equals: ReflectiveMethod.
	self assert: (ReflectivityExamples >> #exampleIvarRead) linkCount equals: 1.
	link uninstall.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class equals: CompiledMethod.
	self assert: (ivar links isEmpty).