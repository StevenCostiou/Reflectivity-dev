migration
migrateObjectToOriginalClass: anObject
	| class |
	class := anObject class.
	class isAnonymous
		ifTrue: [ migratedObjects removeKey: class.
			class superclass adoptInstance: anObject ]