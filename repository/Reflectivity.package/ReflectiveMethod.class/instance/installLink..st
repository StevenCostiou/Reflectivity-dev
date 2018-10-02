invalidate
installLink: aMetaLink
	self increaseLinkCount.
	(self ast hasOption: #optionCompileOnLinkInstallation for: aMetaLink) 
		ifTrue: [ self compileAndInstallCompiledMethod ].
	aMetaLink announceChange