api
temporaryNamed: aTempVarName inMethod: aMethodName for: aClassOrObject option: option
	| temp |
	temp := self lookupTemporaryNamed: aTempVarName inMethod: aMethodName for: aClassOrObject.
	^ self resolveASTLookupFor: temp option: option