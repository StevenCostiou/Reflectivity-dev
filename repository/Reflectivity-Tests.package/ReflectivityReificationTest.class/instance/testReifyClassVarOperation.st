tests - operations
testReifyClassVarOperation
	| node instance |
	node := (ReflectivityExamples >> #exampleClassVarRead) ast variableNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(operation).
	node link: link.
	self assert: node hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleClassVarRead equals: #AClassVar.
	self assert: tag value equals: #AClassVar