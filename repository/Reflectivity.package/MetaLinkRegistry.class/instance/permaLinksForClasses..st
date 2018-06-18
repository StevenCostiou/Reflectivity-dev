permalinks
permaLinksForClasses: targetClasses
	| allPermalinks |
	allPermalinks := permalinks values flattened.
	^ allPermalinks select: [ :p | (targetClasses select: [ :c | p notNil and: [ c == p slotOrVarClass ] ]) notEmpty ]