nodes
testFindingAnonymousNodes
	| link varNode instance objectSpecificVarNode |
	varNode := (ReflectivityExamples >> #exampleSendNoReturn) ast allChildren atRandom.
	
	link := MetaLink new.
	instance := ReflectivityExamples new.
	
	varNode link: link forObject: instance.
	objectSpecificVarNode := link linkInstaller linkToNodesMapper findNodeLike: varNode forObject: instance.
	
	self deny: varNode == objectSpecificVarNode.
	self assert: varNode equals: objectSpecificVarNode