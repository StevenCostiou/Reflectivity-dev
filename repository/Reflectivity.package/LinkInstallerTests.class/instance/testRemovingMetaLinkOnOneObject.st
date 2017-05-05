removing links
testRemovingMetaLinkOnOneObject
	"When removing a link from an object, the object looses the behavior brought by the link"

	| obj1 metalink |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 someMethod.
	self assert: obj1 someInstVar equals: 1.

	"After removing the link, the object is not affected anymore"
	(obj1 class >> #someMethod) ast removeLink: metalink forObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	self assert: obj1 someInstVar equals: nil