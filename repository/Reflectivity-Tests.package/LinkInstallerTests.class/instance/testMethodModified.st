links - updating
testMethodModified
	"When modifying a method for which there was an object specific link,
	all links must be removed"

	| metalink node |	
	obj1 compileTemporaryMethods.
	node := (ReflectivityExamples >> #methodToBeModified) ast allChildren atRandom.

	"Putting a link on a random node should migrate the object to an anonymous subclass"
	metalink := MetaLink new.
	node link: metalink forObject: obj1.
	self assert: obj1 class isAnonymous.
	
	"Modifyinh the original method should remove all object specific links and
	migrate back the object to its original class"
	ReflectivityExamples compile: ('methodToBeModified ^', Time now printString printString).
	self deny: obj1 class isAnonymous.
	self assert: obj1 class == ReflectivityExamples