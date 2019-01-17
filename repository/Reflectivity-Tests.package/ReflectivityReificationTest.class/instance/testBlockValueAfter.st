tests - blocks
testBlockValueAfter
	| blockNode |
	blockNode := (ReflectivityExamples >> #exampleBlock) ast statements first value receiver.
	self assert: blockNode isBlock.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(value).
	blockNode link: link.
	self assert: blockNode hasMetalinkAfter.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleBlock == 5.
	self assert: tag printString equals: [ 2 + 3 ] printString.
	self assert: (ReflectivityExamples >> #exampleBlock) class equals: CompiledMethod.