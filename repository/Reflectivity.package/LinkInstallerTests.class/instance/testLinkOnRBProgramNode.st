nodes
testLinkOnRBProgramNode
	| link varNode instance objectSpecificVarNode |
	varNode := (ReflectivityExamples >> #exampleSendNoReturn) ast allChildren atRandom.
	link := MetaLink new.
	
	instance := ReflectivityExamples new.
	varNode link: link forObject: instance.
	objectSpecificVarNode := link linkInstaller findNodeLike: varNode forObject: instance.
	
	self deny: varNode hasMetalink.
	self assert: objectSpecificVarNode hasMetalink.
	self assert: objectSpecificVarNode links asArray first == link