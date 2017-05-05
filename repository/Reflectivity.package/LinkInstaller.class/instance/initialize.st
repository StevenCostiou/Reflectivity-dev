initialization
initialize
	links := WeakKeyDictionary new.
	nodesForObjects := WeakKeyDictionary new.
	anonSubclassesRegistry := Dictionary new.
	SystemAnnouncer uniqueInstance weak when: MethodModified send: #methodModified: to: self