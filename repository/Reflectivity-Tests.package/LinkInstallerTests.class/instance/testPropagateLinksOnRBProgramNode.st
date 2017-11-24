nodes
testPropagateLinksOnRBProgramNode
	| link link2 varNode instance objectSpecificVarNode |
	varNode := (ReflectivityExamples >> #exampleSendNoReturn) ast allChildren atRandom.
	link := MetaLink new.
	link2 := MetaLink new.
	varNode link: link.
		
	instance := ReflectivityExamples new.
	varNode link: link2 forObject: instance.
	objectSpecificVarNode := link2 linkInstaller linkToNodesMapper findNodeLike: varNode forObject: instance.

	self assert: varNode links size equals: 1.
	self assert: varNode links asArray first == link.
	
	self assert: objectSpecificVarNode links size equals: 2.
	self assert: (objectSpecificVarNode links includes: link).
	self assert: (objectSpecificVarNode links includes: link2).