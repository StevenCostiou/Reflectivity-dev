ast
valueInContext: aBlock
	| process |
	"We need to take care that all code called here can not have active metalinks. We use copies of methods if we call system methods"
	process := Processor rfactiveProcess.
	(process isActive: self level)
		ifFalse: [ ^ self ].
	process shiftLevelUp.
	[aBlock value] rfEnsure: [process shiftLevelDown]
	