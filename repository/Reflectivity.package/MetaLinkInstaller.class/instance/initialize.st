initialization
initialize
	anonSubclassesBuilder := MetaLinkAnonymousClassBuilder new.
	linksRegistry := MetaLinkRegistry new. 
	linkToNodesMapper := MetaLinkNodesMapper new.
	superJumpLinks := OrderedCollection new.
	
	SystemAnnouncer uniqueInstance when: MetalinkChanged do: [ :announcement :annoucer | self metalinkChanged: announcement ].
	SystemAnnouncer uniqueInstance when: MethodModified do: [ :announcement :annoucer | self methodChanged: announcement ].
	SystemAnnouncer uniqueInstance when: MethodRemoved do: [ :announcement :annoucer | self methodRemoved: announcement ].
	SystemAnnouncer uniqueInstance when: MethodAdded  do: [ :announcement :annoucer | self methodAdded: announcement ]