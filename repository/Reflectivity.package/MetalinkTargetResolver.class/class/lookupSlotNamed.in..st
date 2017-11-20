resolving
lookupSlotNamed: aSlotName in: aClassOrObject
	| class |
	class := self classFor: aClassOrObject.
	^ class slotNamed: aSlotName