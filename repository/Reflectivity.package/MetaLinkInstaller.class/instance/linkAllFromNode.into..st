links
linkAllFromNode: aNode into: copyNode
	"If aNode is the original ast node from which a copy was made - namely copyNode,
	and if this node has links, we need to add them to copyNode."
	
	aNode hasLinks
		ifTrue: [	aNode links do: [ :link | copyNode linkIfAbsent: link ] ].
		
	aNode allChildren
		do: [ :c | 
			c hasLinks
				ifTrue: [ | node |
					node := self findSubNode: c in: copyNode.
					c links do: [ :link | node linkIfAbsent: link ] ] ]