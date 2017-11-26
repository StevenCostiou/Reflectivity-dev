installation
uninstall: aMetaLink fromNode: aNode forObject: anObject
	| node |
	self flag: 'Do we need to care if the link is a permalink or not ?'.
	node := linkToNodesMapper findNodeLike: aNode forObject: anObject.
	node ifNil: [ ^ self ].
	node removeLink: aMetaLink.
	self uninstallNode: node forObject: anObject.
	aMetaLink removeNode: node