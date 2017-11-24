mapping
isNode: aNode ownedBy: anObject
	^(nodesForObjects at: anObject ifAbsent:[^false]) includes: aNode