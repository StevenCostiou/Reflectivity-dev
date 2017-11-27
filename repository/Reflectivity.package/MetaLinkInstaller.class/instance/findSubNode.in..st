nodes
findSubNode: node in: methodNode
	^ methodNode allChildren detect: [ :child | child isEquivalentTo: node ] ifNone: [ nil ]