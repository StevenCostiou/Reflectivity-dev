links - installing
testUninstallOneMetaLinkManyObjects
	"Globally uninstalling a link installed on many objects
		- link should not be active anymore
		- objects must recover their original classes"

	| counter metalink |	
	counter := 0.
	
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ counter := counter + 1 ].
	metalink control: #before.
	(obj1 class >> #exampleMethod) ast link: metalink forObject: obj1.
	(obj2 class >> #exampleMethod) ast link: metalink forObject: obj2.
	(obj4 class >> #exampleMethod) ast link: metalink forObject: obj4.

	"The link is removed from 2 out of 3 objects. It should stay active on this last object"
	(obj1 class >> #exampleMethod) ast removeLink: metalink forObject: obj1.
	(obj4 class >> #exampleMethod) ast removeLink: metalink forObject: obj4.

	"Original method must execute and only object 2 increases the counter"
	obj1 exampleMethod.
	self assert: counter equals: 0.
	obj2 exampleMethod.
	self assert: counter equals: 1.
	obj4 exampleMethod.
	self assert: counter equals: 1.