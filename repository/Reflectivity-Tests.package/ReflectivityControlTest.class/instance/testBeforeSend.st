tests - before
testBeforeSend
	| sendNode |
	sendNode := (ReflectivityExamples >> #exampleMethod) sendNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(#node).
	sendNode link: link.
	self assert: sendNode hasMetalinkBefore.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: tag class equals: RBMessageNode.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod.