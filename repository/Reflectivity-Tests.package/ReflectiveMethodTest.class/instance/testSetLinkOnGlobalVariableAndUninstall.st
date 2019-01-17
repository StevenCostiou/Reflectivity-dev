tests - variables
testSetLinkOnGlobalVariableAndUninstall
	| global link |
	selector := #exampleGlobalRead.
	link := MetaLink new.
	global := (Smalltalk globals at: #GlobalForTesting) binding.
	global link: link.
	self assert: (global links includes: link). 
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class equals: ReflectiveMethod.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) linkCount equals: 1.
	link uninstall.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class equals: CompiledMethod.
	global removeProperty: #links.

