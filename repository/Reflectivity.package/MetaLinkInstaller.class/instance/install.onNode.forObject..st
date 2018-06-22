installation
install: aMetaLink onNode: aNode forObject: anObject
	| anonClass ast |
	
	linksRegistry addMetaLink: aMetaLink forObject: anObject.
	anonClass := anonSubclassesBuilder anonymousClassForObject: anObject.
	ast := self astFromNode: aNode forObject: anObject inClass: anonClass.
	ast link: aMetaLink.
	anonSubclassesBuilder migrateObject: anObject toAnonymousClass: anonClass