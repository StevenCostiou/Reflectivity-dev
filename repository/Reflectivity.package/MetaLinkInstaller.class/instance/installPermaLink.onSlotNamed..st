permalinks
installPermaLink: aPermaLink onSlotNamed: aSlotName
	| slot |
	slot := MetalinkTargetResolver slotNamed: aSlotName for: aPermaLink targetObjectOrClass.
	aPermaLink slotOrVariable: slot.
	
	self registerAndInstallPermaLink: aPermaLink forTarget: slot