permalinks
permaLinksForMethod: method
	| class targets |
	class := method methodClass.
	targets := classes at: class ifAbsent: [ #() ].
	^ (permanentTargets associationsSelect: [ :assoc | targets includes: assoc key ]) values
		flattened select: [ :permalink | permalink slotOrVarClass == class ]