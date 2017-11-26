permalinks
testLinkOnClassVarForObject
	| link obj |
	link := MetaLink new.
	obj := ReflectivityExamples2 new.
	
	link linkInstaller installPermaLinkFor: link onClassVarNamed: #classVar for: obj option: #read instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [:node| node isRead]).
	self assert: (link nodes allSatisfy: [:node| node name = #classVar]).		
	link uninstall.
	self assert: link nodes isEmpty.
	
	link linkInstaller installPermaLinkFor: link onClassVarNamed: #classVar for: obj option: #write instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [:node| node isAssignment]).
	self assert: (link nodes allSatisfy: [:node| node variable name = #classVar]).			
	link uninstall.
	self assert: link nodes isEmpty.
	
	link linkInstaller installPermaLinkFor: link onClassVarNamed: #classVar for: obj option: #all instanceSpecific: false.
	self assert: link nodes size equals: 4.	
	link uninstall.
	self assert: link nodes isEmpty.
	
	