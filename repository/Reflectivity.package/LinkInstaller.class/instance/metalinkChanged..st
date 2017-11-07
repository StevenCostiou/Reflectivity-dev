updating
metalinkChanged: aMetaLinkChanged
	aMetaLinkChanged isRemove
		ifTrue: [self halt. ^ self propagateLinkRemoval: aMetaLinkChanged link forNode: aMetaLinkChanged node ].
	^ self propagateLinkAddition: aMetaLinkChanged link forNode: aMetaLinkChanged node