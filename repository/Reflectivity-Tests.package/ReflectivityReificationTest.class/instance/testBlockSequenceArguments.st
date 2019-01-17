tests - blocks - body
testBlockSequenceArguments
	| blockNode |
	blockNode := (ReflectivityExamples >> #exampleBlock) ast statements first value receiver body.
	self assert: blockNode isSequence.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #before;
		arguments: #(arguments).
	blockNode link: link.
	self assert: blockNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleBlock == 5.
	self assert: tag equals: #().
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: CompiledMethod.