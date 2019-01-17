tests - options
testLinkOptionDisabledLink
	| sendNode |
	sendNode := (ReflectivityExamples>>#exampleMethod) sendNodes first.
	link := MetaLink new 
		metaObject: self; 
		options: #(+ optionDisabledLink);
		selector: #tagExec.
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: tag isNil.
	self assert: (ReflectivityExamples>>#exampleMethod) class equals: CompiledMethod.