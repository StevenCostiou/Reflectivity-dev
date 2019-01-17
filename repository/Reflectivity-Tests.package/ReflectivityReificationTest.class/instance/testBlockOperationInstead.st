tests - blocks
testBlockOperationInstead
	| blockNode instance |
	blockNode := (ReflectivityExamples >> #exampleBlock) ast statements first value receiver.
	self assert: blockNode isBlock.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #instead;
		arguments: #(operation). 
	blockNode link: link.
	self assert: blockNode hasMetalinkInstead.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleBlock == self .
	self assert: tag value value equals: 5.
	self assert: tag class equals: RFBlockOperation.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: CompiledMethod.