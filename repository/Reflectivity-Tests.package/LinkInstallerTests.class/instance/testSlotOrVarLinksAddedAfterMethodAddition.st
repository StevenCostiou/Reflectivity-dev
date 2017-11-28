permalinks
testSlotOrVarLinksAddedAfterMethodAddition
	
	|methodNode link|
	methodNode := (ReflectivityExamples2 >> #methodWithInstVarAccess) ast.
	ReflectivityExamples2 new removeNewMethodWithInstVarAccess.
	
	link := MetaLink new.	
	link installOnSlotNamed: #instVar for: ReflectivityExamples2 option: #all instanceSpecific: false.

	self assert: link nodes size equals: 4.
	
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	
	self assert: link nodes size equals: 8.
	link uninstall 
	

	
	