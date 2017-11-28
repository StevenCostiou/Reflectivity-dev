permalinks
testPermaLinkNotInstalledOnObjectIfExistsInClass
	
	|link obj|
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	obj := ReflectivityExamples2 new.
	
	link := MetaLink new.	

	link installOnSlotNamed: #instVar for: ReflectivityExamples2 option: #all instanceSpecific: true.
	self assert: link nodes size equals: 8.	
			
	link installOnSlotNamed: #instVar for: obj option: #all instanceSpecific: true.
	self assert: link nodes size equals: 8.		
	
	link uninstall.
	