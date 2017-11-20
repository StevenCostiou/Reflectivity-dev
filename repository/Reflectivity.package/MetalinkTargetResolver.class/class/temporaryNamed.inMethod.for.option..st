api
temporaryNamed: aTempVarName inMethod: aMethodName for: aClassOrObject option: option
	| temp |
	temp := self lookupTemporaryNamed: aTempVarName asSymbol inMethod: aMethodName for: aClassOrObject.
	^ self resolveASTLookupFor: temp option: option