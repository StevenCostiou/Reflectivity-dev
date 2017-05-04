links
linkAllFromNode: aNode into: anOtherNode
	"If aNode is the original ast node from which a copy was made - namely anOtherNode,
	and if this node has links, we need to add them to anOtherNode."

	anOtherNode == aNode
		ifFalse: [ aNode links ifNotNil: [ :otherLinks | otherLinks do: [ :link | anOtherNode link: link ] ] ]