links
linkAllFromNode: aNode into: anOtherNode
	"If aNode is the original ast node from which a copy was made - namely anOtherNode,
	and if this node has links, we need to add them to anOtherNode."

	aNode hasLinks
		ifTrue: [ aNode links do: [ :link | anOtherNode link: link ] ].
	aNode allChildren
		do: [ :c | 
			c hasLinks
				ifTrue: [ | copyNode |
					copyNode := self findSubNode: aNode in: anOtherNode.
					c links do: [ :link | copyNode link: link ] ] ]