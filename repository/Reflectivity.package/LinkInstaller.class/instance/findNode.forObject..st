nodes
findNode: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ ^ nil ].
	(nodesForObject includes: aNode)
		ifTrue: [ ^ aNode ].
	^ nil