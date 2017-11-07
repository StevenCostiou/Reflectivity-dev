nodes
findNodeLike: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ ^ nil ].
	^ nodesForObject detect: [ :node | node = aNode ] ifNone: [ nil ]