links - removing
testRemovingNodes
	| metalink metalink2 node1 node2 |

	metalink := MetaLink new.
	metalink2 := MetaLink new.
	
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren first link: metalink forObject: obj1.
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren fourth link: metalink2 forObject: obj1.
	
	node1 := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren first.
	node2 := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren fourth.
	
	node1 removeLink: metalink forObject: obj1.
	self assert: obj1 class isAnonymous.
	
	node2 removeLink: metalink2 forObject: obj1.
	self deny: obj1 class isAnonymous