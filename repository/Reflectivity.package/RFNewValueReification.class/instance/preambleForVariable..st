preamble
preambleForVariable: aNode
	"balance stack for instead"
	link control= #instead
		ifTrue: [ ^RFStorePopIntoTempNode named: #RFNewValueReificationVar  ]
		ifFalse: [^RFStoreIntoTempNode named: #RFNewValueReificationVar  ]
	
	