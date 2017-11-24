links - installing
testUninstallLink
	"A link which is object specific must be removed from every possible node when uninstalled throug the MetaLink uninstall api"

	| metalink node |
	metalink := MetaLink new.
	
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast link: metalink.
	(ReflectivityExamples >> #exampleIfTrueIfFalse) ast link: metalink forObject: obj1.
	
	node := (ReflectivityExamples >> #exampleIfTrueIfFalse) ast.
	metalink uninstall.
	
	self deny: obj1 class isAnonymous.
	self assert: node links isNil