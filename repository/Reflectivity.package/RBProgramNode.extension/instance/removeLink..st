*Reflectivity
removeLink: aMetaLink
	self hasMetalink ifFalse: [ ^ self ].
	aMetaLink removeFromAnonymousNodesOf: self.
	self links remove: aMetaLink ifAbsent: [].
	self links ifEmpty: [ self removeProperty: #links ].
	self clearReflectivityAnnotations.
	self methodNode method removeLink: aMetaLink. 