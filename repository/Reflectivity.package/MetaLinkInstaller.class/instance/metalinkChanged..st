updating
metalinkChanged: aMetaLinkChanged
	aMetaLinkChanged isRemove
		ifTrue: [ ^ self propagateLinkRemoval: aMetaLinkChanged link forNode: aMetaLinkChanged node ].
	aMetaLinkChanged isAdd
		ifTrue: [ self propagateLinkAddition: aMetaLinkChanged link forNode: aMetaLinkChanged node ]