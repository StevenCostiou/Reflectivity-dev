ml anon classes
testPropagateSourceCodeModifications
	| obj1 metalink |
	self cleanMetaLinkSystem.
	obj1 := MetaLinkTestObject2 new.

	"Two links are put on the object which is migrated to an anon subclass."
	metalink := MetaLink new.
	(MetaLinkTestObject2 >> #testModified) ast link: metalink forObject: obj1.
	MetaLinkTestObject2 compile: 'testModified ^' , DateAndTime now asNanoSeconds printString.
	self
		assert: (MetaLinkTestObject2 >> #testModified) ast source
		equals: (obj1 class >> #testModified) ast source