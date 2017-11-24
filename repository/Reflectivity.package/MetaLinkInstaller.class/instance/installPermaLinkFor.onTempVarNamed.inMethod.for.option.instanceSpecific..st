permalinks
installPermaLinkFor: aMetaLink onTempVarNamed: aTempName inMethod: aMethodName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| temp |
	self flag: 'Too much parameters, everywhere !'.
	temp := MetalinkTargetResolver
		lookupTemporaryNamed: aTempName
		inMethod: aMethodName
		for: aClassOrObject.
	self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: temp
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	aClassOrObject
		link: aMetaLink
		toNodes: (MetalinkTargetResolver resolveASTLookupFor: temp option: option)