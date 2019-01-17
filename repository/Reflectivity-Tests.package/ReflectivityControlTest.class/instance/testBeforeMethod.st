tests - before
testBeforeMethod
	| methodNode |
	methodNode := (ReflectivityExamples >> #exampleMethod) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod.