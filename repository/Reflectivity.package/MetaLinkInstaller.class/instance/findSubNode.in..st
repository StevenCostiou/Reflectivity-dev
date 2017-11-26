nodes
findSubNode: node in: methodNode
	^ methodNode allChildren detect: [ :child | child = node and: [ child start = node start and: [ child stop = node stop ] ]] ifNone: [ nil ]