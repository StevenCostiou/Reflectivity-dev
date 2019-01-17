tests - method 
testReifyMethodValue
	| methodNode instance |
	methodNode := (ReflectivityExamples >> #exampleMethod) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(value).
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod equals: 5.
	self assert: tag equals: 5