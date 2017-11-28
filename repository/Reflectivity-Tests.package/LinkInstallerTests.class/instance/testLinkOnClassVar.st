permalinks
testLinkOnClassVar
	| link|
	link := MetaLink new.
	
	link installOnClassVarNamed: #classVar for: ReflectivityExamples2 option: #read instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [:node| node isRead]).
	self assert: (link nodes allSatisfy: [:node| node name = #classVar]).		
	link uninstall.
	self assert: link nodes isEmpty.
	
	link installOnClassVarNamed: #classVar for: ReflectivityExamples2 option: #write instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [:node| node isAssignment]).
	self assert: (link nodes allSatisfy: [:node| node variable name = #classVar]).			
	link uninstall.
	self assert: link nodes isEmpty.
	
	link installOnClassVarNamed: #classVar for: ReflectivityExamples2 option: #all instanceSpecific: false.
	self assert: link nodes size equals: 4.	
	link uninstall.
	self assert: link nodes isEmpty.
	
	