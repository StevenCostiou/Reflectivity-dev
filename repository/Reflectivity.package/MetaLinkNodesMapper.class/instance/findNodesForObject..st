mapping
findNodesForObject: anObject
	^ nodesForObjects at: anObject ifAbsent: [ #() ]