class api
testLinkClassToClassVarNamed
	|link instance|	
	link := self link.
		
	ReflectivityExamples2 link: link toClassVariableNamed: #classVar.
	self assert: tag isEmpty.
	
	instance := ReflectivityExamples2 new.
	instance methodWithClassVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance])
	