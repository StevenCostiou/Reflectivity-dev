initialization
initialize
	anonSubclassesBuilder := MetaLinkAnonymousClassBuilder new.
	linksRegistry := MetaLinkRegistry new. 
	linkToNodesMapper := MetaLinkNodesMapper new.
	superJumpLinks := OrderedCollection new.
	
	SystemAnnouncer uniqueInstance weak subscribe: MetalinkChanged send: #metalinkChanged: to: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodModified send: #methodChanged: to: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodRemoved send: #methodRemoved: to: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodAdded  send: #methodAdded: to: self