permalinks
installPermaLinkFor: aMetaLink onClassVarNamed: aClassVarName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| classVar |
	self flag: 'Too much parameters, everywhere !'.
	classVar := MetalinkTargetResolver
		classVariableNamed: aClassVarName
		for: aClassOrObject.
	self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: classVar
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	aClassOrObject
		link: aMetaLink
		toNodes: (MetalinkTargetResolver resolveASTLookupFor: classVar option: option)