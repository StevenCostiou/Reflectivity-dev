links - installing
testUninstallLinkFromNode
	"A link which is object specific must be removed from every possible node when uninstalled throug the MetaLink uninstall api"

	| metalink node |
	metalink := MetaLink new.
	
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast link: metalink.
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast link: metalink forObject: obj1.
	
	node := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast.
	self assert: obj1 class isAnonymous.
	self assert: metalink nodes size equals: 2.
	self assert: (metalink nodes includes: node).
	self assert: (metalink nodes includes: ((obj1 class >> #exampleIfTrueIfFalse) ast)).
	
	node removeLink: metalink forObject: obj1.
	
	self deny: obj1 class isAnonymous.
	self assert: metalink nodes size equals: 1.
	self assert: (metalink nodes includes: node)