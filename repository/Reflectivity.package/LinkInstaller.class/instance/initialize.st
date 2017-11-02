initialization
initialize
	links := WeakKeyDictionary new.
	nodesForObjects := WeakKeyDictionary new.
	anonSubclassesRegistry := Dictionary new.
	SystemAnnouncer uniqueInstance
		when: MetalinkChanged
		do: [ :announcement :annoucer | self metalinkChanged: announcement ]