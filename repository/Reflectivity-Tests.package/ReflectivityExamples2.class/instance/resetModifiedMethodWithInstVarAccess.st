generation
resetModifiedMethodWithInstVarAccess
	self class
		compile:
			'modifiedMethodWithInstVarAccess
	instVar := 5.
	instVar := 6.
	instVar > 5 ifTrue:[^ instVar raisedTo: 2]'
		classified: 'example'