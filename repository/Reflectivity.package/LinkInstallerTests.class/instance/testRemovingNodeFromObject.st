removing links
testRemovingNodeFromObject
	| obj1 metalink metalink2 |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject new.

	"The MetaLink must change the someInstVar value to 1 before #someMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 someInstVar: 1 ].
	metalink control: #before.
	(obj1 class lookupSelector: #someMethod) ast link: metalink forObject: obj1.

	"The MetaLink must change the someInstVar value to 2 before #someMethod"
	metalink2 := MetaLink new.
	metalink2 selector: #value.
	metalink2 metaObject: [ obj1 someInstVar: 2 ].
	metalink2 control: #after.
	(obj1 class lookupSelector: #someOtherMethod) ast link: metalink2 forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 someMethod.
	obj1 someOtherMethod. 
	self assert: obj1 someInstVar equals: 2.

	"After removing metalink2, the object is not affected anymore"
	(obj1 class >> #someOtherMethod) ast removeLink: metalink forObject: obj1.
	obj1 someInstVar: nil.
	obj1 someMethod.
	self assert: obj1 someInstVar equals: 1.
	self should: obj1 class >> #someOtherMethod raise: KeyNotFound