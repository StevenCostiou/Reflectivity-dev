tests
testMetaLinkOnOneObject
	"Only one metalink for on object of a particular class. Other instances of this class must remain unaffected."

	| obj1 obj2 metalink |
	self cleanMetaLinkSystem. 
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 when the someMethod message is sent"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	metalink enableForObject: obj1.
	metalink linkToNode: (obj1 class >> #someMethod) ast.

	"Only the object on which has been installed is affected"
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: 1.
	self assert: obj2 someInstVar equals: nil.

	"After removing the link, the object is not affected anymore"
	metalink disableForObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: nil.
	self assert: obj2 someInstVar equals: nil