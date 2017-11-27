permalinks
permaLinkOn: aMetaLink for: aClassOrObject target: aSlotOrVar method: aMethodOrNil option: option instanceSpecific: instanceSpecific
	| permaLink |
	self flag: 'Too much parameters, everywhere !'.
	permaLink := PermaLink new.
	permaLink persistenceType: option.
	permaLink slotOrVariable: aSlotOrVar.
	permaLink isInstanceSpecific: instanceSpecific.
	permaLink slotOrVarClass: aClassOrObject.
	permaLink slotOrVarMethod: aMethodOrNil.
	permaLink link: aMetaLink.
	^ permaLink