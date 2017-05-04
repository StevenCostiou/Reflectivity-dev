anonymous classes
migrateObject: anObject toAnonymousClass: anonClass
	anObject class == anonClass
		ifFalse: [ anonClass adoptInstance: anObject ]