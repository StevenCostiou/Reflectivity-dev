generation
generateNewMethodWithInstVarAccess
	self class
		compile:
			'newMethodWithInstVarAccess
	instVar := 5.
	instVar := 6.
	instVar > 5 ifTrue:[^ instVar raisedTo: 2]'
		classified: 'example'