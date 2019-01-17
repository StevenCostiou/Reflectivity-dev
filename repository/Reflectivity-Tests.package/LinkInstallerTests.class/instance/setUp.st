running
setUp
	super setUp.
	Smalltalk garbageCollectMost.
	MetaLink uninstallAll.
	Smalltalk garbageCollectMost.
	obj1 := ReflectivityExamples new.
	obj2 := ReflectivityExamples new.
	obj3 := ReflectivityExamples new.
	obj4 := ReflectivityExamples2 new