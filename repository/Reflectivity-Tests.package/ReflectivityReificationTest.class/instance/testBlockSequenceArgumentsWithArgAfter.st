tests - blocks - body
testBlockSequenceArgumentsWithArgAfter
	| blockNode |
	blockNode := (ReflectivityExamples >> #exampleBlockWithArg) ast statements first value receiver body.
	self assert: blockNode isSequence.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(arguments).
	blockNode link: link.
	self assert: blockNode hasMetalinkAfter.
	self assert: (ReflectivityExamples >> #exampleBlockWithArg) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleBlockWithArg == 5.
	self assert: tag equals: #(2).
	self assert: (ReflectivityExamples >> #exampleBlockWithArg) class equals: CompiledMethod.