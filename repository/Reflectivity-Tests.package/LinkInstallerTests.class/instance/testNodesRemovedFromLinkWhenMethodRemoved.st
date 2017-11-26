permalinks
testNodesRemovedFromLinkWhenMethodRemoved
	"Ensures that when a method is removed and a permalink is present, the nodes are removed from the link as they do not exist anymore"
	
	|methodNode link|
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	methodNode := (ReflectivityExamples2 >> #methodWithInstVarAccess) ast.
	
	link := MetaLink new.	 
	link linkInstaller installPermaLinkFor: link onSlotNamed: #instVar for: ReflectivityExamples2 option: #all instanceSpecific: false.	
	self assert: link nodes size equals: 8.
	
	ReflectivityExamples2 new removeNewMethodWithInstVarAccess.	
	self assert: link nodes size equals: 4.
	link uninstall 
	

	
	