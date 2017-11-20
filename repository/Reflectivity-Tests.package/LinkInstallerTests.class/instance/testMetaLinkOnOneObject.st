links - installing
testMetaLinkOnOneObject
	"Only one metalink for on object of a particular class. Other instances of this class must remain unaffected."

	| metalink |

	"The MetaLink must change the tag value to 1 before #exampleMethod"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 tagExec: 1 ].
	metalink control: #before.
	(obj1 class >> #exampleMethod) ast link: metalink forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 exampleMethod.
	obj2 exampleMethod.
	self assert: obj1 tag equals: 1.
	self assert: obj2 tag equals: nil.

	"After removing the link, the object is not affected anymore"
	(obj1 class >> #exampleMethod) ast removeLink: metalink forObject: obj1.
	obj1 tagExec: nil.
	obj1 exampleMethod.
	obj2 exampleMethod.
	self assert: obj1 tag equals: nil.
	self assert: obj2 tag equals: nil