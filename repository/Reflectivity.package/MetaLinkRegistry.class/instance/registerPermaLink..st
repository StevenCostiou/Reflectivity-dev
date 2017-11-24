permalinks
registerPermaLink: aPermaLink
	| registeredLinks registeredSlots |
	registeredLinks := permalinks at: aPermaLink slotOrVariable ifAbsentPut: [ Set new ].
	registeredLinks add: aPermaLink.
	registeredSlots := classes at: aPermaLink slotOrVarClass ifAbsentPut: [ Set new ].
	registeredSlots add: aPermaLink slotOrVariable