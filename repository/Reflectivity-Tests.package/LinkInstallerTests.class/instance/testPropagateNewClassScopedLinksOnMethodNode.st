links - updating
testPropagateNewClassScopedLinksOnMethodNode
	"When adding a class scoped link from a node,
	it must also be added to all anonymous classes with copy of this node and link."

	| metalink metalink2 node anonNode |	
	node := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast.
	
	metalink := MetaLink new.
	metalink2 := MetaLink new.
	node link: metalink2 forObject: obj1.

	"The link shall not be present in the anon class node"
	anonNode := (obj1 class >> #exampleIfTrueIfFalse) ast.
	self deny: (anonNode links includes: metalink).

	"After adding a link to the base class, it must be present on the copied node
	in the anonymous subclass"
	node link: metalink.
	self assert: (anonNode links includes: metalink)