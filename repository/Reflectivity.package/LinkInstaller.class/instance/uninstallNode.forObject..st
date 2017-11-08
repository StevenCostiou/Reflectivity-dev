nodes
uninstallNode: aNode forObject: anObject
	| nodesForObject |
	"If there is no more instance specific links for this node, we remove it from the installer table. There may be ''class specific'' remaining on the node."
	(self isNodeWithInstanceSpecificLinks: aNode)
		ifFalse: [ self removeNode: aNode forObject: anObject ].

	"If there is no more ast nodes "
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ #() ].
	nodesForObject isEmpty
		ifTrue: [ anObject class isAnonymous
				ifTrue: [ anObject class superclass adoptInstance: anObject ] ]