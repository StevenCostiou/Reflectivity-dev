resolving
lookupTemporaryNamed: aTempVarName inMethod: aMethodName for: aClassOrObject
	| class method |
	class := self classFor: aClassOrObject.
	method := class lookupSelector: aMethodName.
	^ method temporaryVariableNamed: aTempVarName