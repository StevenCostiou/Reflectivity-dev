tests - before
testBeforeSequence
	| seqNode |
	seqNode := (ReflectivityExamples >> #exampleAssignment) ast body.
	self assert: seqNode isSequence.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	seqNode link: link.
	self assert: seqNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleAssignment) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleAssignment equals: 3.
	self assert: tag equals: 'yes'.
	self assert: (ReflectivityExamples >> #exampleAssignment) class equals: CompiledMethod.