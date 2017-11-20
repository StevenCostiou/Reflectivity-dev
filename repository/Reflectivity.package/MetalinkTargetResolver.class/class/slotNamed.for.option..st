api
slotNamed: aSlotName for: aClassOrObject option: option
	| slot |
	slot := self lookupSlotNamed: aSlotName in: aClassOrObject.
	^ self resolveASTLookupFor: slot option: option