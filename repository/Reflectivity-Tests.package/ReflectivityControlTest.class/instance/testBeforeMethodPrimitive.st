tests - before
testBeforeMethodPrimitive
	| methodNode |
	methodNode := (ReflectivityExamples >> #examplePrimitiveMethod) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	self assert: (ReflectivityExamples>>#examplePrimitiveMethod) isRealPrimitive.	
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #examplePrimitiveMethod) class equals: CompiledMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new examplePrimitiveMethod class equals: ByteString.
	self deny: (ReflectivityExamples>>#examplePrimitiveMethod) isRealPrimitive.	
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #examplePrimitiveMethod) class equals: CompiledMethod.
	link uninstall.
	self assert: (ReflectivityExamples >> #examplePrimitiveMethod) class equals: CompiledMethod.
	self assert: (ReflectivityExamples>>#examplePrimitiveMethod) isRealPrimitive.