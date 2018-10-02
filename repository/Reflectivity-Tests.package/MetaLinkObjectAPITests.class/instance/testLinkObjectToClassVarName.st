object - api
testLinkObjectToClassVarName
	|link instance |	
	self skip.
	self flag: 'must be fixed'.
	
	link := self link.
	
	instance := ReflectivityExamples2 new.	
	
	instance link: link toClassVariableNamed: #classVar.
	self assert: tag isEmpty.	

	instance methodWithClassVarAccess.
	ReflectivityExamples2 new methodWithClassVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t == instance])