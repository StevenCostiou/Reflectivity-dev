permalinks
permaLinksForMethod: method
	| class slotsOrVars methodNodes usedSlotsOrVars |
	class := method methodClass.
	slotsOrVars := classes at: class ifAbsent: [ #() ].
	methodNodes := method ast allChildren.
	usedSlotsOrVars := slotsOrVars flatCollect: [ :sov | methodNodes select: [ :node | node name = sov name ] ] asSet.
	^ usedSlotsOrVars flatCollect: [ :sov | (permalinks at: sov) select: [ :permalink | permalink slotOrVarClass = class ] ]