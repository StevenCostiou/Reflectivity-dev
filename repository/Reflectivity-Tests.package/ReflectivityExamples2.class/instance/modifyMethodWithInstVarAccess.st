example
modifyMethodWithInstVarAccess
	self class compile:'modifiedMethodWithInstVarAccess
	instVar > 5 ifTrue:[^ instVar raisedTo: 2]'
	
