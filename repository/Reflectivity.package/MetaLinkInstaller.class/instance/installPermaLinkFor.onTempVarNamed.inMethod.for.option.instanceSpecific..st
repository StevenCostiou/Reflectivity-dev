permalinks
installPermaLinkFor: aMetaLink onTempVarNamed: aTempName inMethod: aMethodName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| temp permalink |
	self flag: 'Too much parameters, everywhere !'.
	temp := MetalinkTargetResolver lookupTemporaryNamed: aTempName inMethod: aMethodName for: aClassOrObject.
	permalink := self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: temp
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	(linksRegistry canReinstallPermaLink: permalink)
		ifFalse: [ ^ self ].
	linksRegistry registerPermaLink: permalink.
	aClassOrObject link: aMetaLink toNodes: (MetalinkTargetResolver resolveASTLookupFor: temp option: option)