links - removing
testRemovingNodes
	| metalink metalink2 node1 node2 |

	metalink := MetaLink new.
	metalink2 := MetaLink new.
	
	(MetaLinkTestObject >> #someMethod) ast allChildren first link: metalink forObject: obj1.
	(MetaLinkTestObject >> #someMethod) ast allChildren fourth link: metalink2 forObject: obj1.
	
	node1 := (MetaLinkTestObject >> #someMethod) ast allChildren first.
	node2 := (MetaLinkTestObject >> #someMethod) ast allChildren fourth.
	
	node1 removeLink: metalink forObject: obj1.
	self assert: obj1 class isAnonymous.
	
	node2 removeLink: metalink2 forObject: obj1.
	self deny: obj1 class isAnonymous