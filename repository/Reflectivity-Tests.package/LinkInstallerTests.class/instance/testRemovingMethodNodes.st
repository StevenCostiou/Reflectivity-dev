links - removing
testRemovingMethodNodes
	| metalink metalink2 node1 node2 |

	metalink := MetaLink new.
	metalink2 := MetaLink new.
	
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast link: metalink forObject: obj1.
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren last link: metalink2 forObject: obj1.
	
	node1 := (ReflectivityExamples >> #exampleIfTrueIfFalse)ast.
	node2 := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast allChildren last.
	
	node1 removeLink: metalink forObject: obj1.
	self assert: obj1 class isAnonymous.
	
	node2 removeLink: metalink2 forObject: obj1.
	self deny: obj1 class isAnonymous