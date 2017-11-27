object - api
testLinkObjectToSlotNamed

	|link instance |	
	link := self link.
	
	instance := ReflectivityExamples2 new.	
	
	instance link: link toSlotNamed: #instVar.
	self assert: tag isEmpty.	

	instance methodWithInstVarAccess.
	ReflectivityExamples2 new methodWithInstVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t == instance])