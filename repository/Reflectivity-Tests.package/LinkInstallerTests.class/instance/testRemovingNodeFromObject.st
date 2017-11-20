links - removing
testRemovingNodeFromObject
	| metalink metalink2 |
	
	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	(obj1 class lookupSelector: #exampleMethod) ast link: metalink forObject: obj1.
	metalink2 := MetaLink new.
	(obj1 class lookupSelector: #exampleSendNoReturn) ast link: metalink2 forObject: obj1.

	"The two nodes must now exist in the anon subclass"
	self shouldnt: [ obj1 class >> #exampleSendNoReturn ] raise: KeyNotFound.
	self shouldnt: [ obj1 class >> #exampleMethod ] raise: KeyNotFound.

	"After removing metalink2, the node it was put on must be removed from the anon subclass."
	(obj1 class >> #exampleSendNoReturn) ast removeLink: metalink2 forObject: obj1.
	self should: [ obj1 class >> #exampleSendNoReturn ] raise: KeyNotFound.
	self deny: (obj1 class lookupSelector: #exampleSendNoReturn) isNil