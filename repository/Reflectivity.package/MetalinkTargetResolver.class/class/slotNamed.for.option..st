api
slotNamed: aSlotName for: aClassOrObject option: option
	| slot |
	slot := self lookupSlotNamed: aSlotName asSymbol in: aClassOrObject.
	^ self resolveASTLookupFor: slot option: option