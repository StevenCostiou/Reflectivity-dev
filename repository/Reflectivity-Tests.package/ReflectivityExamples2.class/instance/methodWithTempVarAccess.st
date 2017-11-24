as yet unclassified
methodWithTempVarAccess
	|temp|
	temp := 5.
	temp := 6.
	temp > 5 ifTrue:[^ temp raisedTo: 2]
	
