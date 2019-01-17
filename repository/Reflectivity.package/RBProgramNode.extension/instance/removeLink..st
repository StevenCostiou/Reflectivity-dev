*Reflectivity
removeLink: aMetaLink
	self hasMetalink
		ifFalse: [ ^ self ].
	self links remove: aMetaLink ifAbsent: [  ].
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
	(self methodNode methodClass methodDict includesKey: self methodNode selector)
		ifFalse: [ ^ self ].
	self methodNode method removeLink: aMetaLink.
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged linkRemoved: aMetaLink fromNode: self)