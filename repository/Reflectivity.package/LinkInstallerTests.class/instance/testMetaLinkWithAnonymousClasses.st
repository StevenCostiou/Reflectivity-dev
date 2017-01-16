tests
testMetaLinkWithAnonymousClasses
	| obj1 obj2 metalink |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"We just need to link a MetaLink to an object"
	metalink := MetaLink new.
	metalink activateForObject: obj1.
	metalink linkToNode: (obj1 class >> #someMethod) ast forObject: obj1.

	"One of the 2 objects must have migrated to another class"
	self assert: obj1 class ~= obj2 class.
	self assert: obj1 class superclass == MetaLinkTestObject.
	self assert: obj2 class == MetaLinkTestObject.

	"After removing the link, the object is back to its original class"
	metalink unlinkFromNode: (obj1 class >> #someMethod) ast forObject: obj1.
	self assert: obj1 class == MetaLinkTestObject.
	self assert: obj2 class == MetaLinkTestObject