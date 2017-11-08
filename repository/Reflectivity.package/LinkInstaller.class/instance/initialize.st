initialization
initialize
	links := WeakKeyDictionary new.
	nodesForObjects := WeakKeyDictionary new.
	anonSubclassesRegistry := Dictionary new.
	SystemAnnouncer uniqueInstance when: MetalinkChanged do: [ :announcement :annoucer | self metalinkChanged: announcement ].
	SystemAnnouncer uniqueInstance when: MethodModified do: [ :announcement :annoucer | self methodChanged: announcement ].
	SystemAnnouncer uniqueInstance when: MethodRemoved do: [ :announcement :annoucer | self methodRemoved: announcement ]