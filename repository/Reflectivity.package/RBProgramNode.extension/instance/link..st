*Reflectivity
link: aMetaLink
	(aMetaLink checkForCompatibilityWith: self)
		ifFalse: [ self error: 'link requests reification that can not be provided by this node' ].
	(self propertyAt: #links ifAbsentPut: [ OrderedCollection new ]) add: aMetaLink.
	aMetaLink installOn: self.
	self clearReflectivityAnnotations.
	self methodNode method installLink: aMetaLink.
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged linkAdded: aMetaLink toNode: self)