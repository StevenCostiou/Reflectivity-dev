tests - blocks
testBlockOperationBefore
	| blockNode |
	blockNode := (ReflectivityExamples >> #exampleBlock) ast statements first value receiver.
	self assert: blockNode isBlock.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #before;
		arguments: #(operation).
	blockNode link: link.
	self assert: blockNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleBlock == 5.
	self assert: tag class equals: RFBlockOperation.
	self assert: tag value value equals: 5.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: CompiledMethod.