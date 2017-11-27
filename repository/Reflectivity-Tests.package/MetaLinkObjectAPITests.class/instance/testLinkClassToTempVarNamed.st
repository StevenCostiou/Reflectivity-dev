class api
testLinkClassToTempVarNamed
	|link instance|	
	link := self linkForTemp.
		
	ReflectivityExamples2 link: link toTemporaryNamed: #temp inMethod: #methodWithTempVarAccess.
	self assert: tag isEmpty.
	
	instance := ReflectivityExamples2 new.
	instance methodWithTempVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t = 'ok'])