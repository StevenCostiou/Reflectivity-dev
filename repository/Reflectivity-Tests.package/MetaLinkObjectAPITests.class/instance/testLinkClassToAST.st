class api
testLinkClassToAST
	|link instance|	
	link := self link.
		
	ReflectivityExamples2 link: link toAST: (ReflectivityExamples2 >> #exampleMethod) ast.
	self assert: tag isEmpty.
	instance := ReflectivityExamples2 new.
	instance exampleMethod.
	self assert: tag size = 1.
	self assert: tag first == instance
	
		