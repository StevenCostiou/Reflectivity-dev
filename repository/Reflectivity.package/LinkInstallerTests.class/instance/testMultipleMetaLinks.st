ml anon classes
testMultipleMetaLinks
	| counter obj1 obj2 metalink metalink2 |
	self cleanMetaLinkSystem.
	counter := MetaLinkCounterObject new.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject2 new.
		
	"First MetaLink affects all objects"
	metalink := MetaLink new.
	metalink selector: #increase.
	metalink metaObject: counter.
	metalink control: #before.
	(MetaLinkTestObject >> #someMethod) ast link: metalink.	
		(MetaLinkTestObject2 >> #someMethod) ast link: metalink.	
	
	"The second MetaLink affects only object 3"
	metalink2 := MetaLink new.
	metalink2 selector: #doubleIncrease.
	metalink2 metaObject: counter.
	metalink2 control: #after.
	(MetaLinkTestObject2 >> #someMethod) ast link: metalink2.
	
	"Original method must execute as usual"
	self assert: counter value equals: 0.
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter value equals: 1.
	self assert: obj2 someMethod equals: 'hello world 2'.
	self assert: counter value equals: 4.

	"The link is removed from the 3 objects."
	(MetaLinkTestObject >> #someMethod) ast removeLink: metalink.	
	(MetaLinkTestObject2 >> #someMethod) ast removeLink: metalink.	
	
	"Original method must execute as usual"
	self assert: obj1 someMethod equals: 'hello world'.
	self assert: counter value equals: 4.
	self assert: obj2 someMethod equals: 'hello world 2'.
	self assert: counter value equals: 6.
