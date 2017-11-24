nodes
findSubNode: node in: methodNode
	^ methodNode allChildren detect: [ :child | child = node ] ifNone: [ nil ]