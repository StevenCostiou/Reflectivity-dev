nodes
testCallToSuper
	| obj link node |
	obj := ReflectivityExamples2Subclass new.
	node := (ReflectivityExamples2Subclass  >> #methodWithOverrides) ast.
	link := MetaLink new.	

	node link: link forObject: obj.
	
	self assert: obj methodWithOverrides equals: 'top + down'