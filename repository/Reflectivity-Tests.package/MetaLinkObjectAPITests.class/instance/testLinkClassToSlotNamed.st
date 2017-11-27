class api
testLinkClassToSlotNamed

	|link instance|	
	link := self link.
		
	ReflectivityExamples2 link: link toSlotNamed: #instVar.
	self assert: tag isEmpty.
	
	instance := ReflectivityExamples2 new.
	instance methodWithInstVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance])