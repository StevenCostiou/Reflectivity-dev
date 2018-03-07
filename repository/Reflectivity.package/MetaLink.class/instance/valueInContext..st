ast
valueInContext: aBlock
	| process |
	process := Processor rfactiveProcess.
	(process isActive: self level)
		ifFalse: [ ^ self ].
	process shiftLevelUp.
	aBlock value.
	process shiftLevelDown.