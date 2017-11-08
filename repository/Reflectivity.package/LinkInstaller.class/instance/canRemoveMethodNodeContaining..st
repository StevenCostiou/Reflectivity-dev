links - count
canRemoveMethodNodeContaining: aNode
	| methodNode allNodes |
	methodNode := aNode methodNode.
	allNodes := methodNode allChildren select: [ :c | c hasLinks ].
	methodNode hasLinks
		ifTrue: [ allNodes add: methodNode ].
	^ allNodes allSatisfy: [ :node | (self isNodeWithInstanceSpecificLinks: node) not ]