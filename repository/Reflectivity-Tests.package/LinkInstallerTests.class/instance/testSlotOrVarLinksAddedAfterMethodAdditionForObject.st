permalinks
testSlotOrVarLinksAddedAfterMethodAdditionForObject
	
	|methodNode link obj|

	methodNode := (ReflectivityExamples2 >> #methodWithInstVarAccess) ast.
	obj := ReflectivityExamples2 new.
	ReflectivityExamples2 new removeNewMethodWithInstVarAccess.
	
	link := MetaLink new.	
	link linkInstaller installPermaLinkFor: link onSlotNamed: #instVar for: obj option: #all instanceSpecific: true.

	self assert: link nodes size equals: 4.
	
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	
	self assert: link nodes size equals: 8.
	link uninstall 
	

	
	