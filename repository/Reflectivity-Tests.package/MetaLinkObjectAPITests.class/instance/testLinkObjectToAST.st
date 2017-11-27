object - api
testLinkObjectToAST
	|link instance instance2|	
	link := self link.	

	instance := ReflectivityExamples2 new.
	instance2 := ReflectivityExamples2 new.
	
	instance link: link toAST: (ReflectivityExamples2 >> #exampleMethod) ast.
	self assert: tag isEmpty.
	
	instance exampleMethod.
	instance2 exampleMethod.
	self assert: tag size = 1.
	self assert: tag first == instance