common api
testLinkToSlotNamedAll

	|link instance |	
	link := self link.	
	instance := ReflectivityExamples2 new.	

	"For all instances"	
	ReflectivityExamples2 link: link toSlotNamed: #instVar option: #all.
	self assert: tag isEmpty.	

	instance methodWithInstVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t == instance]).
	
	"For instance only"
	link uninstall.
	tag := OrderedCollection new.
	instance link: link toSlotNamed: #instVar option: #all.

	instance methodWithInstVarAccess.
	ReflectivityExamples2 new methodWithInstVarAccess.
	
	self assert: tag size = 4.
	self assert: (tag allSatisfy: [ :t| t == instance])