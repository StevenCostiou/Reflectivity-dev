reflectivity
emitPrepareLinkAfter: aNode
	"We need to emit the first part of the block for the ensure: wrap here"
	| copied |
	copied := #().
	aNode hasMetalinkAfter ifFalse: [^self].
	aNode allAfterAreWeak ifTrue: [ ^self ].
	aNode isMethod ifTrue: [ copied := aNode argumentNames, aNode temporaryNames ].
	aNode isSequence ifTrue: [ copied := aNode parent argumentNames, aNode parent temporaryNames ].
	methodBuilder
		pushClosureCopyCopiedValues: copied
		args: #()
		jumpTo: #block