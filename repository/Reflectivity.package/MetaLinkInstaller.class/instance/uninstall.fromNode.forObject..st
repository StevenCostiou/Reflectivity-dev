installation
uninstall: aMetaLink fromNode: aNode forObject: anObject
	| node |
	node := linkToNodesMapper findNodeLike: aNode forObject: anObject.
	node ifNil: [ ^ self ].
	node removeLink: aMetaLink.
	self uninstallNode: node forObject: anObject.
	aMetaLink removeNode: node