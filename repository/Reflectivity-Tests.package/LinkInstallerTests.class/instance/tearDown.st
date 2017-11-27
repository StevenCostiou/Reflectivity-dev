running
tearDown
	ReflectivityExamples2 new removeModifiedMethodWithInstVarAccess.
	Smalltalk garbageCollectMost.
	MetaLink uninstallAll.
	Smalltalk garbageCollectMost