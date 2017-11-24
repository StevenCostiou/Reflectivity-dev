permalinks
installPermaLinkFor: aMetaLink onSlotNamed: aSlotName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| slot |
	slot := MetalinkTargetResolver slotNamed: aSlotName for: aClassOrObject.
	self
		permaLinkOn: aMetaLink
		for: aClassOrObject
		target: slot
		method: nil
		option: option
		instanceSpecific: instanceSpecific.
	aClassOrObject
		link: aMetaLink
		toNodes: (MetalinkTargetResolver resolveASTLookupFor: slot option: option)