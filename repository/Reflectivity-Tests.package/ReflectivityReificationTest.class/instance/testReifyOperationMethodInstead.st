tests - operations
testReifyOperationMethodInstead
	| methodNode instance |
	methodNode := (ReflectivityExamples >> #exampleWithArg:) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #instead;
		arguments: #(operation).
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleWithArg:) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: (instance exampleWithArg: 3) equals: self.
	self assert: tag class == RFMethodOperation.
	self assert: tag value equals: 5