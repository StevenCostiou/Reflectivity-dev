tests
testMultipleMetaLinksOnOneObject
	"Only one metalink for on object of a particular class. Other instances of this class must remain unaffected."

	| obj1 obj2 metalink metalink2 |
	self cleanMetaLinkSystem. 
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	metalink enableForObject: obj1.
	metalink linkToNode: (obj1 class >> #someMethod) ast forObject: obj1.
	
	"The second MetaLink must add 1 to someInstVar value after #someMethod"
	metalink2 := MetaLink new.
	metalink2 selector: #value.
	metalink2 metaObject: [ obj1 someInstVar: obj1 someInstVar + 1 ].
	metalink2 control: #after.
	metalink2 enableForObject: obj1.
	metalink2 linkToNode: (obj1 class >> #someMethod) ast forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 someInstVar: 0.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: 2.
	self assert: obj2 someInstVar equals: nil.

	"After removing the links, the object is not affected anymore"
	metalink unlinkFromNode: (obj1 class >> #someMethod) ast forObject: obj1.
	metalink2 unlinkFromNode: (obj1 class >> #someMethod) ast forObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	obj2 someMethod.
	self assert: obj1 someInstVar equals: nil.
	self assert: obj2 someInstVar equals: nil