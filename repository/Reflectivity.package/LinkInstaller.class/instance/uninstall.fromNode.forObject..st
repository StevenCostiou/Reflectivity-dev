installation
uninstall: aMetaLink fromNode: aNode forObject: anObject
	aNode removeLink: aMetaLink.
	self uninstallNode: aNode forObject: anObject