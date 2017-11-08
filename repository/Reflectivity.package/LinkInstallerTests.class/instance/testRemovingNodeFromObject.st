links - removing
testRemovingNodeFromObject
	| obj1 metalink metalink2 |
	
	obj1 := MetaLinkTestObject new.

	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	(obj1 class lookupSelector: #someMethod) ast link: metalink forObject: obj1.
	metalink2 := MetaLink new.
	(obj1 class lookupSelector: #someOtherMethod) ast link: metalink2 forObject: obj1.

	"The two nodes must now exist in the anon subclass"
	self shouldnt: [ obj1 class >> #someOtherMethod ] raise: KeyNotFound.
	self shouldnt: [ obj1 class >> #someMethod ] raise: KeyNotFound.

	"After removing metalink2, the node it was put on must be removed from the anon subclass."
	(obj1 class >> #someOtherMethod) ast removeLink: metalink2 forObject: obj1.
	self should: [ obj1 class >> #someOtherMethod ] raise: KeyNotFound.
	self deny: (obj1 class lookupSelector: #someOtherMethod) isNil