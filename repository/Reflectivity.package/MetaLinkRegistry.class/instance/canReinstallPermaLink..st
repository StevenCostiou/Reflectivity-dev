permalinks
canReinstallPermaLink: permalink
	^ (self hasPermaLinks: permalink link) not
		or: [ | slotsOrVarsWithPermalink |
			slotsOrVarsWithPermalink := classes at: permalink slotOrVarClass ifAbsent: [ #() ].
			slotsOrVarsWithPermalink noneSatisfy: [ :slotOrVar | permalink slotOrVariable == slotOrVar ] ]