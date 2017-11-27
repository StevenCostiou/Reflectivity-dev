object - api
testLinkObjectToTempVarName

	|link instance |	
	link := self link.
	
	instance := ReflectivityExamples2 new.	
	
	instance link: link toTemporaryNamed: #temp inMethod: #methodWithTempVarAccess.
	self assert: tag isEmpty.	

	instance methodWithTempVarAccess.
	ReflectivityExamples2 new methodWithTempVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t == instance])