common api
testLinkToTempVarNameReads
	|link instance |	
	link := self link.	
	instance := ReflectivityExamples2 new.	
	
	"For all instances"
	ReflectivityExamples2 link: link toTemporaryNamed: #temp inMethod: #methodWithTempVarAccess option: #read.
	self assert: tag isEmpty.	

	instance methodWithTempVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance]).
	
	"For instance only"
	link uninstall.
	tag := OrderedCollection new.
	instance link: link toTemporaryNamed: #temp inMethod: #methodWithTempVarAccess option: #read.

	instance methodWithTempVarAccess.
	ReflectivityExamples2 new methodWithTempVarAccess.
	
	self assert: tag size = 2.
	self assert: (tag allSatisfy: [ :t| t == instance])