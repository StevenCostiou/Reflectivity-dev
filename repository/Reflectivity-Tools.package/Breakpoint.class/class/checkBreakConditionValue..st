checkCondition
checkBreakConditionValue: aValue
	(aValue isKindOf: Boolean) ifTrue: [ ^ aValue ].
	Error signal: 'Breakpoint condition returned a non boolean value'.