links - removing
testRemovingMetaLinkOnOneObject
	"When removing a link from an object, the object looses the behavior brought by the link"

	| metalink |

	"The MetaLink must change the tag value to 1 before #exampleIfTrueIfFalse"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [ obj1 tagExec: 1 ].
	metalink control: #before.
	(obj1 class >> #exampleIfTrueIfFalse) ast link: metalink forObject: obj1.

	"Only the object on which has been installed is affected"
	obj1 exampleIfTrueIfFalse.
	self assert: obj1 tag equals: 1.

	"After removing the link, the object is not affected anymore"
	(obj1 class >> #exampleIfTrueIfFalse) ast removeLink: metalink forObject: obj1.
	obj1 tagExec: nil.
	obj1 exampleIfTrueIfFalse.
	self assert: obj1 tag equals: nil