permalinks
installPermaLinkFor: aMetaLink onSlotNamed: aSlotName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| slot permalink |
	self flag: 'Too much parameters, everywhere !'.
	slot := MetalinkTargetResolver slotNamed: aSlotName for: aClassOrObject.
	permalink := self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: slot
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	(linksRegistry canReinstallPermaLink: permalink)
		ifFalse: [ ^ self ].
	linksRegistry registerPermaLink: permalink.
	aClassOrObject link: aMetaLink toNodes: (MetalinkTargetResolver resolveASTLookupFor: slot option: option)