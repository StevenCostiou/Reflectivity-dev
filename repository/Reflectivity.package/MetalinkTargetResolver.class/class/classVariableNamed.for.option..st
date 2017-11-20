api
classVariableNamed: aClassVariableName for: aClassOrObject option: option
	| var |
	var := self lookupClassVariableNamed: aClassVariableName asSymbol in: aClassOrObject.
	^ self resolveASTLookupFor: var option: option