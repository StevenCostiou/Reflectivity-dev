running
tearDown
	ReflectivityExamples2 new removeModifiedMethodWithInstVarAccess.
	ReflectivityExamples new removeTemporaryMethods.
	Smalltalk garbageCollectMost.
	MetaLink uninstallAll.
	Smalltalk garbageCollectMost.
	super tearDown.