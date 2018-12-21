links - installing
testTwoMetaLinksOneObject
	"Two metalinks for one object of a particular class. Other instances of this class must remain unaffected."

	| metalink metalink2 | 
	self flag: 'Split this test into smaller ones !'.	

	"The MetaLink must change the tag value to 1 before #exampleMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 tagExec: 1 ].
	metalink control: #before.
	(obj1 class >> #exampleMethod) ast link: metalink forObject: obj1.

	"The second MetaLink must add 1 to tag value after #exampleMethod"
	metalink2 := MetaLink new.
	metalink2 selector: #value.
	metalink2 metaObject: [ obj1 tagExec: obj1 tag + 1 ].
	metalink2 control: #before.
	(obj1 class >> #exampleMethod) ast link: metalink2 forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 tagExec: 0.
	obj1 exampleMethod.
	obj2 exampleMethod.
	self assert: obj1 tag equals: 2.
	self assert: obj2 tag equals: nil.

	"After removing the links, the object is not affected anymore.
	We should also test that one likn can be removed while the other stays active."
	(obj1 class >> #exampleMethod) ast removeLink: metalink forObject: obj1.
	(obj1 class >> #exampleMethod) ast removeLink: metalink2 forObject: obj1.
	metalink uninstall.
	metalink2 uninstall.
	obj1 tagExec: nil.
	obj1 exampleMethod.
	obj2 exampleMethod.
	self assert: obj1 tag equals: nil.
	self assert: obj2 tag equals: nil