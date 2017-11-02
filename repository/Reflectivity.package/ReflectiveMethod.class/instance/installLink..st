invalidate
installLink: aMetaLink
	self increaseLinkCount.
	(self ast hasOption: #optionCompileOnLinkInstallation for: aMetaLink) 
		ifTrue: [ self compileAndInstallCompiledMethod ].
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged linkAdded: aMetaLink toNode: self ast)	