links - updating
testPropagateClassScopedLinksRemovalFromMethodNode
	"When removing a class scoped link from a method node,
	it must also be removed from all anonymous classes with copy of this node and link."

	| metalink metalink2 node anonNode |	
	
	node := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast.

	metalink := MetaLink new.
	node link: metalink.
		
	metalink2 := MetaLink new.
	node link: metalink2 forObject: obj1.

	"The link is removed from the original class"
	anonNode := (obj1 class >> #exampleIfTrueIfFalse) ast.
	node removeLink: metalink.

	"The link shall not be present in the anon class node"
	self deny: (anonNode links includes: metalink)