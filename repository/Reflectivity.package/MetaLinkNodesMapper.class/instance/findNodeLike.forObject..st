mapping
findNodeLike: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ #() ].
	^ nodesForObject detect: [ :node | node isEquivalentTo: aNode ] ifNone: [ nil ]