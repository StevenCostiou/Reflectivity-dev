permalinks
testSlotOrVarLinksRemainAfterMethodModification
	|methodNode link|

	ReflectivityExamples2 new resetModifiedMethodWithInstVarAccess.
	methodNode := (ReflectivityExamples2 >> #modifiedMethodWithInstVarAccess) ast.
	
	link := MetaLink new.	
	link installOnSlotNamed: #instVar for: ReflectivityExamples2 option: #all instanceSpecific: false.

	self assert: link nodes size equals: 12.
	
	ReflectivityExamples2 new modifyMethodWithInstVarAccess.
		
	self assert: link nodes size equals: 10.
	self assert: (link nodes allSatisfy: [:n| n links includes: link ]).
	link uninstall 
