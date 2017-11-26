permalinks
testLinkOnTempVarForObject
	|  link obj |
	
	link := MetaLink new.
	obj := ReflectivityExamples2 new.
	
	link linkInstaller
		installPermaLinkFor: link
		onTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: obj
		option: #read
		instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [ :node | node isRead ]).
	self assert: (link nodes allSatisfy: [ :node | node name = #temp ]).
	self assert: (link nodes allSatisfy: [ :node | node isTemp ]).
	link uninstall.
	self assert: link nodes isEmpty.
	
	link linkInstaller
		installPermaLinkFor: link
		onTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: obj
		option: #write
		instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [ :node | node isAssignment ]).
	self assert: (link nodes allSatisfy: [ :node | node variable name = #temp ]).
	self assert: (link nodes allSatisfy: [ :node | node variable isTemp ]).
	link uninstall.
	self assert: link nodes isEmpty.
	
	link linkInstaller
		installPermaLinkFor: link
		onTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: obj
		option: #all
		instanceSpecific: false.
	self assert: link nodes size equals: 4.
	link uninstall.
	self assert: link nodes isEmpty