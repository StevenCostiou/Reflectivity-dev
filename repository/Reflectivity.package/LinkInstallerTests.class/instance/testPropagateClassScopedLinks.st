updating links
testPropagateClassScopedLinks
	"When class scoped links exist on a node,
	they must also be added to all anonymous classes with copy of this node and link."

	| obj1 metalink metalink2 node anonNode |
	
	obj1 := MetaLinkTestObject new.
	node := (MetaLinkTestObject >> #someMethod) ast.

	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	metalink2 := MetaLink new.
	node link: metalink.
	node link: metalink2 forObject: obj1.
	anonNode := (obj1 class >> #someMethod) ast.
	self assert: (anonNode links includes: metalink)