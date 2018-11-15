generate
preamble: aNode
	aNode isMessage ifTrue: [ ^self preambleForMessage: aNode ].
	aNode isMethod  ifTrue: [ ^self preambleForMethod: aNode ].
	^super preamble: aNode.