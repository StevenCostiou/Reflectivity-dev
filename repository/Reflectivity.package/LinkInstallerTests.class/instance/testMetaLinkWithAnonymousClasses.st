ml anon classes
testMetaLinkWithAnonymousClasses
	| obj1 obj2 metalink |
	
	obj1 := MetaLinkTestObject new.
	obj2 := MetaLinkTestObject new.

	"We just need to link a MetaLink to an object"
	metalink := MetaLink new.
	(obj1 class >> #someMethod) ast link: metalink forObject: obj1.

	"One of the 2 objects must have migrated to another class"
	self assert: obj1 class ~= obj2 class.
	self assert: obj1 class superclass == MetaLinkTestObject.
	self assert: obj2 class == MetaLinkTestObject.

	"After removing the link, the object is back to its original class"
	(obj1 class >> #someMethod) ast removeLink: metalink forObject: obj1.
	self assert: obj1 class == MetaLinkTestObject.
	self assert: obj2 class == MetaLinkTestObject