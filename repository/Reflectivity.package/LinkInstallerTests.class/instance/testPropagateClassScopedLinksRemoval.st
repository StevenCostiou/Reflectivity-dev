ml anon classes
testPropagateClassScopedLinksRemoval
	"When removing a class scoped link from a node,
	it must also be removed from all anonymous classes with copy of this node and link."

	| obj1 metalink metalink2 |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.

	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	metalink2 := MetaLink new.
	(MetaLinkTestObject >> #someMethod) ast link: metalink.
	(MetaLinkTestObject >> #someMethod) ast link: metalink2 forObject: obj1.

	"The link is removed from the original class"
	(MetaLinkTestObject >> #someMethod) ast removeLink: metalink.

	"The link shall not be present in the anon class node"
	self assert: obj1 class isAnonymous.
	self deny: ((obj1 class >> #someMethod) ast links includes: metalink)