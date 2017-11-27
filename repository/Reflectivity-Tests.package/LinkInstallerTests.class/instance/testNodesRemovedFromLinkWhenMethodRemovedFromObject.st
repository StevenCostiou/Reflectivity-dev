permalinks
testNodesRemovedFromLinkWhenMethodRemovedFromObject
	"Ensures that when a method is removed and a permalink is present, the nodes are removed from the link as they do not exist anymore"
	
	|link obj|
	ReflectivityExamples2 new generateNewMethodWithInstVarAccess.
	obj := ReflectivityExamples2 new.
	
	link := MetaLink new.	

	link linkInstaller installPermaLinkFor: link onSlotNamed: #instVar for: obj option: #all instanceSpecific: true.	
	
	self assert: link nodes size equals: 8.	
	self assert: (link nodes allSatisfy: [:node| (obj class >> #newMethodWithInstVarAccess) ast allChildren includes: node]) .
	ReflectivityExamples2 new removeNewMethodWithInstVarAccess.	
	self assert: link nodes size equals: 4.
	
	link uninstall.
	self assert: link nodes isEmpty
	

	
	