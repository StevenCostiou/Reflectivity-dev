preamble
preamble: aNode
	(aNode isKindOf: RBProgramNode) ifFalse: [ ^#() ]. "variables not yet suported"
	aNode isMessage ifTrue: [ ^self preambleForMessage: aNode ].
	aNode isMethod	ifTrue: [ ^self preambleForMethod: aNode ].
	aNode isSequence ifTrue: [ ^self preambleSequence: aNode ].
	aNode isReturn ifTrue: [ ^ self preambleForReturn: aNode ].
	aNode isDynamicArray ifTrue: [ ^self preambleForArray: aNode ].
	aNode isAssignment ifTrue: [ ^self preambleForAssignment: aNode ].
	aNode isVariable ifTrue: [ ^self preambleForVariable: aNode ].
	^#().