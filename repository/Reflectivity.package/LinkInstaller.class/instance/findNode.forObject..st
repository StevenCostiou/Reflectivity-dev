nodes
findNode: aNode forObject: anObject
	| nodesForObject compiledMethod |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ ^ nil ].
	(nodesForObject includes: aNode)
		ifTrue: [ ^ aNode ].

	"Second try in case there are no instance specific links. That may happen if a link for aNode in anObject has been 	installed then removed and if the object still has dedicated 	links."
	compiledMethod := aNode methodNode method.
	^ (anObject class methodDict
		at: compiledMethod selector
		ifAbsent: [ nil ]) ifNotNil: [ :cm | cm ast ]