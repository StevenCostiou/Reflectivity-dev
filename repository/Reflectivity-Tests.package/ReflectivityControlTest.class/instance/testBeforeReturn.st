tests - before
testBeforeReturn
	| returnNode |
	returnNode := (ReflectivityExamples >> #exampleLiteral) ast statements first.
	self assert: returnNode isReturn.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec.
	returnNode link: link.
	self assert: returnNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleLiteral) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleLiteral == 2.
	self assert: tag equals: 'yes'.
	self assert: (ReflectivityExamples >> #exampleLiteral) class equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleLiteral) isQuick.