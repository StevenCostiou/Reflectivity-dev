links - installing
testUninstallOneMetaLinkManyObjects
	"Globally uninstalling a link installed on many objects
		- link should not be active anymore
		- objects must recover their original classes"

	| counter metalink |
	
	counter := 0.
	
	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ counter := counter + 1 ].
	metalink control: #before.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.
	(obj2 class >> #someMethod) ast link: metalink forObject: obj2.
	(obj4 class >> #someMethod) ast link: metalink forObject: obj4.

	"The link is removed from 2 out of 3 objects. It should stay active on this last object"
	(obj1 class >> #someMethod) ast removeLink: metalink forObject: obj1.
	(obj4 class >> #someMethod) ast removeLink: metalink forObject: obj4.

	"Original method must execute and only object 2 increases the counter"
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter equals: 0.
	self assert: obj2 someMethod equals: 'hello world'.
	self assert: counter equals: 1.
	self assert: obj4 someMethod equals: 'hello world 2'.
	self assert: counter equals: 1.