running
setUp
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.
	obj3 := MetaLinkTestObject new.
	obj4 := MetaLinkTestObject2 new.
	Smalltalk garbageCollectMost.
	MetaLink uninstallAll