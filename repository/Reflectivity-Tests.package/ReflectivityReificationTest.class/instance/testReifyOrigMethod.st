tests - allnodes
testReifyOrigMethod
	| varNode instance origMethod |
	origMethod := ReflectivityExamples >> #exampleIvarRead.
	varNode := (ReflectivityExamples >> #exampleIvarRead) ast body statements last value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(originalmethod).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleIvarRead equals: 33.
	self deny: tag equals: (ReflectivityExamples >> #exampleIvarRead).
	self assert: (tag == origMethod).