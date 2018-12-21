permalinks
testLinkOnTempVar
	| methodNode link |
	methodNode := (ReflectivityExamples2 >> #methodWithTempVarAccess) ast.
	link := MetaLink new.
	
	link installOnTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: ReflectivityExamples2
		option: #read
		instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [ :node | node isRead ]).
	self assert: (link nodes allSatisfy: [ :node | node name = #temp ]).
	self assert: (link nodes allSatisfy: [ :node | node isTemp ]).
	link uninstall.
	self assert: link nodes isEmpty.
	
	link installOnTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: ReflectivityExamples2
		option: #write
		instanceSpecific: false.
	self assert: link nodes size equals: 2.
	self assert: (link nodes allSatisfy: [ :node | node isWrite ]).
	self assert: (link nodes allSatisfy: [ :node | node name = #temp ]).
	self assert: (link nodes allSatisfy: [ :node | node isTemp ]).
	link uninstall.
	self assert: link nodes isEmpty.
	
	link installOnTempVarNamed: #temp
		inMethod: #methodWithTempVarAccess
		for: ReflectivityExamples2
		option: #all
		instanceSpecific: false.
	self assert: link nodes size equals: 4.
	link uninstall.
	self assert: link nodes isEmpty