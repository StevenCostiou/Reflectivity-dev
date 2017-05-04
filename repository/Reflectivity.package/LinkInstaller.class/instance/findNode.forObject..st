nodes
findNode: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ ^ nil ].
	(nodesForObject includes: aNode)
		ifTrue: [ ^ aNode ].
	^ nil	"
	compiledMethod := aNode methodNode method.
	^ (anObject class methodDict
		at: compiledMethod selector
		ifAbsent: [ nil ]) ifNotNil: [ :cm | cm ast ]"