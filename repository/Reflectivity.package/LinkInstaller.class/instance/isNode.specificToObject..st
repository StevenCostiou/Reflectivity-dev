nodes
isNode: aNode specificToObject: anObject
	| nodesForObject compiledMethod |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ ^ nil ].
	(nodesForObject includes: aNode)
		ifTrue: [ ^ aNode ].

	"We try a second time in case the node has already been copied in the object's class but has no instance specific links"
	compiledMethod := aNode methodNode method.
	^ (anObject class methodDict
		at: compiledMethod selector
		ifAbsent: [ nil ]) ifNotNil: [ :cm | cm ast ]