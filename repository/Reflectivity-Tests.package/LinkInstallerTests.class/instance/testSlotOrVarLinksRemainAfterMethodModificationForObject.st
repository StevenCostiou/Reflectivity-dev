permalinks
testSlotOrVarLinksRemainAfterMethodModificationForObject
	|methodNode link obj|

	obj := ReflectivityExamples2 new.
	ReflectivityExamples2 new resetModifiedMethodWithInstVarAccess.
	methodNode := (ReflectivityExamples2 >> #modifiedMethodWithInstVarAccess) ast.
	
	link := MetaLink new.	
	link installOnSlotNamed: #instVar for: obj option: #all instanceSpecific: true.

	self assert: link nodes size equals: 12.
	"self halt."
	ReflectivityExamples2 new modifyMethodWithInstVarAccess.
	self assert: link nodes size equals: 10.
	self assert: (link nodes allSatisfy: [:n| n links includes: link ]).
	link uninstall 