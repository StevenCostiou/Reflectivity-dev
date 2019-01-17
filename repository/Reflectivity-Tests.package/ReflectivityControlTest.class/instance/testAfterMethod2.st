tests - after
testAfterMethod2
	| methodNode instance |
	methodNode := (ReflectivityExamples >> #exampleMethod2) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec;
		control: #after.
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod2) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod2 equals: instance.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleMethod2) class equals: CompiledMethod