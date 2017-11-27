links - updating
testMethodRemoved
	"When removing a method for which there was an object specific link,
	all links must be removed"

	| metalink node |	
	obj1 compileTemporaryMethods.
	node := (ReflectivityExamples >> #methodToBeRemoved) ast allChildren atRandom.

	"Putting a link on a random node should migrate the object to an anonymous subclass"
	metalink := MetaLink new.
	node link: metalink forObject: obj1.
	self assert: obj1 class isAnonymous.
		
	"Removing the original method should remove all object specific links and
	migrate back the object to its original class"
	ReflectivityExamples removeSelector: #methodToBeRemoved.
	self deny: obj1 class isAnonymous.
	self assert: obj1 class == ReflectivityExamples.
	self deny: metalink hasNodes.
	self assert: (metalink linkInstaller linkToNodesMapper findNodeLike: node forObject: obj1) isNil. 