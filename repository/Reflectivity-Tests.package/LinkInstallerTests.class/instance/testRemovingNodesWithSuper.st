links - removing
testRemovingNodesWithSuper
	| obj link node |
	obj := ReflectivityExamples2Subclass new.
	node := (ReflectivityExamples2Subclass >> #methodWithOverrides) ast.
	link := MetaLink new.
	node link: link forObject: obj.
	self assert: obj class isAnonymous.
	node removeLink: link forObject: obj.
	self deny: obj class isAnonymous