example
methodWithClassVarAccess
	classVar := 5.
	classVar := 6.
	classVar > 5 ifTrue:[^ classVar raisedTo: 2]
	
