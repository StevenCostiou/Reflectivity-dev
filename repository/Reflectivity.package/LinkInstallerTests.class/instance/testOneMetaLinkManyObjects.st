one ml - many objects
testOneMetaLinkManyObjects
	"Multiple MetaLinks for one object of a particular class. Other instances of this class must remain unaffected."

	| counter obj1 obj2 obj3 metalink |
	
	counter := 0.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.
	obj3 := MetaLinkTestObject2 new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ counter := counter + 1 ].
	metalink control: #before.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.
	(obj2 class >> #someMethod) ast link: metalink forObject: obj2.
	(obj3 class >> #someMethod) ast link: metalink forObject: obj3.

	"Original method must execute as usual while the counter is increased"
	self assert: counter equals: 0.
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter equals: 1.
	self assert: obj2 someMethod equals: 'hello world'.
	self assert: counter equals: 2.
	self assert: obj3 someMethod equals: 'hello world 2'.
	self assert: counter equals: 3