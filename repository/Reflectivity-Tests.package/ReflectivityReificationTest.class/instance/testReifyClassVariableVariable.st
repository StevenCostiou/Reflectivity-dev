tests - variables
testReifyClassVariableVariable
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(variable).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class equals: ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: instance exampleClassVarRead equals: #AClassVar.
	self assert: tag equals: classVar.