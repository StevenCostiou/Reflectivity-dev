installation
install: aMetaLink onNode: aNode forObject: anObject
	| anonClass ast |
	self addMetaLink: aMetaLink forObject: anObject.
	anonClass := self anonymousClassForObject: anObject.
	ast := self astFromNode: aNode forObject: anObject inClass: anonClass.
	ast link: aMetaLink.
	self migrateObject: anObject toAnonymousClass: anonClass