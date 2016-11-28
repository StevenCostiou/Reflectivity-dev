installation
uninstall: aMetaLink fromNode: aNode forObject: anObject
	| nodesForObject |
	aNode removeLink: aMetaLink.

	"If there is no more instance specific links for this node, we remove it from the installer table.
	There may be ''class specific'' remaining on the node."
	(self instanceSpecificsLinksCountForNode: aNode) = 0
		ifTrue: [ self removeNode: aNode forObject: anObject ].

	"If there is no more ast nodes "
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ nil ].
	(nodesForObject isNil or: [ nodesForObject isEmpty ])
		ifTrue: [ anObject class isAnonymous
				ifTrue: [ anObject class superclass adoptInstance: anObject ] ]