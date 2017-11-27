common api
testLinkToClassVarNameWrites
	|link instance |	
	link := self link.
	
	"For all instances"
	instance := ReflectivityExamples2 new.		
	ReflectivityExamples2 link: link toClassVariableNamed: #classVar option: #write.
	self assert: tag isEmpty.	

	instance methodWithClassVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance]).
	
	"For instance only"	
	link uninstall.
	tag := OrderedCollection new.
	instance link: link toClassVariableNamed: #classVar option: #write.

	instance methodWithClassVarAccess.
	ReflectivityExamples2 new methodWithClassVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance])