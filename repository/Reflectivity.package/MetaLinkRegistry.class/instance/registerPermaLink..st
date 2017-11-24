permalinks
registerPermaLink: aPermaLink
	| registeredTargets registeredLinks registeredSlots |
	registeredTargets := permanentTargets at: aPermaLink slotOrVariable ifAbsentPut: [ Set new ].
	registeredTargets add: aPermaLink.
	
	registeredLinks := permalinks at: aPermaLink link ifAbsentPut: [ Set new ].
	registeredLinks add: aPermaLink.
	
	registeredSlots := classes at: aPermaLink slotOrVarClass ifAbsentPut: [ Set new ].
	registeredSlots add: aPermaLink slotOrVariable