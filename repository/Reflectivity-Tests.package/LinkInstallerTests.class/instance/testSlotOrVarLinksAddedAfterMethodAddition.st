permalinks
testSlotOrVarLinksAddedAfterMethodAddition
	
	|methodNode link|
	methodNode := (ReflectivityExamples2 >> #methodWithInstVarAccess) ast.
	
	link := MetaLink new.	
	link linkInstaller installPermaLinkFor: link onSlotNamed: #instVar for: ReflectivityExamples2 option: #all instanceSpecific: false.
	
	ReflectivityExamples2 new removeNewMethodWithInstVarAccess.
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	
	self assert: link nodes size equals: 8.
	link uninstall 
	

	
	