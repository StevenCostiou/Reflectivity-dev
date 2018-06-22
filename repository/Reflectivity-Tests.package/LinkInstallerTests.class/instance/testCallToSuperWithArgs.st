nodes
testCallToSuperWithArgs
	| obj link node |
	obj := ReflectivityExamples2Subclass new.
	node := (ReflectivityExamples2Subclass  >> #methodWithOverrides:with:) ast.
	link := MetaLink new.	

	node link: link forObject: obj.
	
	self assert: (obj methodWithOverrides: 'top' with: 'down') equals: 'topdowntopdown'