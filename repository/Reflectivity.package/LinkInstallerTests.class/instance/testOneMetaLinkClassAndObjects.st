one ml - many objects
testOneMetaLinkClassAndObjects
	"Installs a MetaLink on one class. Installs another MetaLink on one instance of this class.
	- all instances of the class must be affected by the first MetaLink
	- only one specific instance must be affected by the second MetaLink"

	| counter obj1 obj2 obj3 metalink metalink2 |
	self cleanMetaLinkSystem.
	counter := MetaLinkCounterObject new.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.
	obj3 := MetaLinkTestObject new.
	
	"First MetaLink affects all objects"
	metalink := MetaLink new.
	metalink selector: #increase.
	metalink metaObject: counter.
	metalink control: #before.
	(MetaLinkTestObject >> #someMethod) ast link: metalink.	
	
	"The second MetaLink affects only object 3"
	metalink2 := MetaLink new.
	metalink2 selector: #doubleIncrease.
	metalink2 metaObject: counter.
	metalink2 control: #after.
	(MetaLinkTestObject >> #someMethod) ast link: metalink2 forObject: obj3.
	
	"Original method must execute as usual"
	self assert: counter value equals: 0.
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter value equals: 1.
	self assert: obj2 someMethod equals: 'hello world'.
	self assert: counter value equals: 2.
	
	"For object 3, the first MetaLink must be active and increase counter by 1.
	The second MetaLink must affect only this object and increase counter by 2.
	The counter value must be increased by 3."
	self assert: obj3 someMethod equals: 'hello world'.
	self assert: counter value equals: 5.

	"The link is removed from the 3 objects."
	(MetaLinkTestObject >> #someMethod) ast removeLink: metalink.	

	"Original method must execute as usual"
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter value equals: 5.
	self assert: obj2 someMethod equals: 'hello world'.
	self assert: counter value equals: 5.

	"The first link is still active on object 3 while it should not... or should it ?"
	self assert: obj3 someMethod equals: 'hello world'.
	self assert: counter value equals: 7.
	(obj3 class >> #someMethod) ast removeLink: metalink2 forObject: obj3.

	self assert: obj3 someMethod equals: 'hello world'.
	self assert: counter value equals: 7.
	