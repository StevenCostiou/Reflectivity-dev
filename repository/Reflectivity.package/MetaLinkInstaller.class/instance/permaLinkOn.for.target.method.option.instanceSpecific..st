permalinks
permaLinkOn: aMetaLink for: aClassOrObject target: aSlotOrVar method: aMethodOrNil option: option instanceSpecific: instanceSpecific
	| permaLink |
	permaLink := PermaLink new.
	permaLink persistenceType: option.
	permaLink slotOrVariable: aSlotOrVar.
	permaLink isInstanceSpecific: instanceSpecific.
	permaLink slotOrVarClass: (MetalinkTargetResolver classFor: aClassOrObject).
	permaLink slotOrVarMethod: aMethodOrNil.
	linksRegistry registerPermaLink: permaLink