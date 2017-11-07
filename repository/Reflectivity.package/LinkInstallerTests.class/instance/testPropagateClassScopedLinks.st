updating links
testPropagateClassScopedLinks
	"When class scoped links exist on a node,
	they must also be added to all anonymous classes with copy of this node and link."

	| metalink metalink2 node anonNode |		
	node := (MetaLinkTestObject >> #someMethod) ast allChildren atRandom.

	metalink := MetaLink new.
	node link: metalink.
	
	metalink2 := MetaLink new.
	node link: metalink2 forObject: obj1.
	
	anonNode := metalink linkInstaller findSubNode: node in: (obj1 class >> #someMethod) ast.
	
	self assert: (anonNode links includes: metalink)