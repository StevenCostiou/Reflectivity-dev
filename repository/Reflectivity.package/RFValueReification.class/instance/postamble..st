generate
postamble: aNode
	(aNode isKindOf: RBProgramNode) ifFalse: [ ^#() ].
	aNode isMessage ifTrue: [^RFStoreIntoTempNode named: self varName. ].
	aNode isCascade ifTrue: [^RFStoreIntoTempNode named: self varName. ].
	aNode isBlock ifTrue: [^RFStoreIntoTempNode named: self varName].
	^super postamble: aNode.
	 