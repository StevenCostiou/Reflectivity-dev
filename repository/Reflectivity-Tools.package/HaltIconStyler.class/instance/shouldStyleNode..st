testing
shouldStyleNode: aNode
	| selectorsToBeHighlighted |
	selectorsToBeHighlighted := { 'halt'. 'halt:'. 'haltIf:'. 'haltIfNil' }.
	^aNode isMessage and: [ selectorsToBeHighlighted anySatisfy: [ :sel| sel = aNode selector ]].