many ml - one object
testTwoMetaLinksOneObject
	"Two metalinks for one object of a particular class. Other instances of this class must remain unaffected."

	| obj1 obj2 metalink metalink2 |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.

	"The second MetaLink must add 1 to someInstVar value after #someMethod"
	metalink2 := MetaLink new.
	metalink2 selector: #value.
	metalink2 metaObject: [ obj1 someInstVar: obj1 someInstVar + 1 ].
	metalink2 control: #after.
	(obj1 class >> #someMethod) ast link: metalink2 forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 someInstVar: 0.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: 2.
	self assert: obj2 someInstVar equals: nil.

	"After removing the links, the object is not affected anymore.
	We should also test that one likn can be removed while the other stays active."
	(obj1 class >> #someMethod) ast removeLink: metalink forObject: obj1.
	(obj1 class >> #someMethod) ast removeLink: metalink2 forObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: nil.
	self assert: obj2 someInstVar equals: nil