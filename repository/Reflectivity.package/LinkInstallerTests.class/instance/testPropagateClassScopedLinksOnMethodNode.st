links - updating
testPropagateClassScopedLinksOnMethodNode
	"When class scoped links exist on a method node,
	they must also be added to all anonymous classes with copy of this node and link."

	| metalink metalink2 node anonNode |

	node := (MetaLinkTestObject >> #someMethod) ast.

	metalink := MetaLink new.
	node link: metalink.
	
	metalink2 := MetaLink new.
	node link: metalink2 forObject: obj1.
	
	anonNode := (obj1 class >> #someMethod) ast.
	
	self assert: (anonNode links includes: metalink)