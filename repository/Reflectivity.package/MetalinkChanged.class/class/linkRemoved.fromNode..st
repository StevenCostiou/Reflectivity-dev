as yet unclassified
linkRemoved: link fromNode: aNode
	^ (self linkRemoved: link)
		node: aNode;
		yourself