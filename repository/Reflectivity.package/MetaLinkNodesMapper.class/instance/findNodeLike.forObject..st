mapping
findNodeLike: aNode forObject: anObject
	| nodesForObject |
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ #() ].
	^ nodesForObject
		detect: [ :node | 
			(node = aNode
				and: [ node start = aNode start and: [ node stop = aNode stop ] ])
				or: [ node == aNode ] ]
		ifNone: [ nil ]