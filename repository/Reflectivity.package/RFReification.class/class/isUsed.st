testing
isUsed
	"all my sublasses are used"
	^self name = 'RFReification'
		ifTrue: [ super isUsed ]
		ifFalse: [ true ]