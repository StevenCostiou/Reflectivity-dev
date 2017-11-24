mapping
findNodeLike: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ #() ].
	^ nodesForObject detect: [ :node | node = aNode ] ifNone: [ nil ]