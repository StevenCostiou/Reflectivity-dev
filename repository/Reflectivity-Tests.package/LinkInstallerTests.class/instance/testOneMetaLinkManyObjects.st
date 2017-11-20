links - installing
testOneMetaLinkManyObjects
	| counter metalink |
	counter := 0.
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ counter := counter + 1 ].
	metalink control: #before.
	(obj1 class >> #exampleMethod) ast link: metalink forObject: obj1.
	(obj2 class >> #exampleMethod) ast link: metalink forObject: obj2.
	(obj4 class >> #exampleMethod) ast link: metalink forObject: obj4.

	"Original method must execute as usual while the counter is increased"
	self assert: counter equals: 0.
	obj1 exampleMethod.
	self assert: counter equals: 1.
	obj2 exampleMethod.
	self assert: counter equals: 2.
	obj4 exampleMethod.
	self assert: counter equals: 3