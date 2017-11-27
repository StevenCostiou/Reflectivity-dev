permalinks
installPermaLinkFor: aMetaLink onClassVarNamed: aClassVarName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| classVar permalink |
	self flag: 'Too much parameters, everywhere !'.
	classVar := MetalinkTargetResolver classVariableNamed: aClassVarName for: aClassOrObject.
	permalink := self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: classVar
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	(linksRegistry canReinstallPermaLink: permalink)
		ifFalse: [ ^ self ].
	linksRegistry registerPermaLink: permalink.
	aClassOrObject link: aMetaLink toNodes: (MetalinkTargetResolver resolveASTLookupFor: classVar option: option)