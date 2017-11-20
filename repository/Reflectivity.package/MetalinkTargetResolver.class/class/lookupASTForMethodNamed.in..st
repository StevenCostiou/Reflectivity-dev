resolving
lookupASTForMethodNamed: aMethodName in: aClassOrObject
	| class |
	class := self classFor: aClassOrObject.
	^ (class lookupSelector: aMethodName) ast