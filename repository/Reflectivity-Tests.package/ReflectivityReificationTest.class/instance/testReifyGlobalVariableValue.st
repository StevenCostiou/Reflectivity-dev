tests - variables
testReifyGlobalVariableValue
	| globalVar instance |
	globalVar := GlobalForTesting binding.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	globalVar link: link.
	self assert: globalVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class equals: ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: instance exampleGlobalRead equals: GlobalForTesting.
	self assert: tag equals: #GlobalForTesting.