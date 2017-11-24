migration
migrateObject: anObject toAnonymousClass: anonClass
	anObject class == anonClass
		ifFalse: [ anonClass adoptInstance: anObject.
			migratedObjects at: anonClass put: anObject ]