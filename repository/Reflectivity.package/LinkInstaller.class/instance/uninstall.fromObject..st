as yet unclassified
uninstall: aMetaLink fromObject: anObject
	| objectsForLink |
	objectsForLink := links
		at: aMetaLink
		ifAbsent: [ aMetaLink uninstall.
			^ self ].
	objectsForLink
		remove: anObject
		ifAbsent: [ "The object is not present for this link... should we raise an error ?" ^ self ].

	"For now we just consider that the link was specific to the object and that there is no other link on the object"
	aMetaLink uninstall.
	anObject class superclass adoptInstance: anObject