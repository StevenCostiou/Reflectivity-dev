ml anon classes
testPropagateClassScopedLinks
	"When adding a class scoped link from a node,
	it must also be added to all anonymous classes with copy of this node and link."

	| obj1 metalink metalink2 |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.

	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	metalink2 := MetaLink new.
	(MetaLinkTestObject >> #someMethod) ast link: metalink2 forObject: obj1.
	
	"The link shall not be present in the anon class node"
	self assert: obj1 class isAnonymous.
	self deny: ((obj1 class >> #someMethod) ast links includes: metalink).
	
	"After adding a link to the base class, it must be present on the copied node
	in the anonymous subclass"
	(MetaLinkTestObject >> #someMethod) ast link: metalink.
	self assert: obj1 class isAnonymous.
	self assert: ((obj1 class >> #someMethod) ast links includes: metalink).
