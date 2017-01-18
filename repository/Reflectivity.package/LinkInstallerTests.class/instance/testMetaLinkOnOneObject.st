one ml - one object
testMetaLinkOnOneObject
	"Only one metalink for on object of a particular class. Other instances of this class must remain unaffected."

	| obj1 obj2 metalink |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: 1.
	self assert: obj2 someInstVar equals: nil.

	"After removing the link, the object is not affected anymore"
	(obj1 class >> #someMethod) ast removeLink: metalink forObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: nil.
	self assert: obj2 someInstVar equals: nil