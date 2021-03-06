nodes
astFromNode: aNode forObject: anObject inClass: anonClass
	"Getting the ast node in the anonymous class.
	If it does not exists, it is copied in the anon class from the original node."

	^ (linkToNodesMapper findNodeLike: aNode forObject: anObject)
		ifNil: [ | copyNode |
			copyNode := self copyNode: aNode inClass: anonClass.
			linkToNodesMapper addNode: copyNode forObject: anObject ]