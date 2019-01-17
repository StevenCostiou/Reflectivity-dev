tests - after - variables
testAfterSlot
	| iVar instance |
	iVar := ReflectivityExamples slotNamed: #ivar.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(name).
	iVar link: link.
	self assert: iVar hasMetalink.
	self
		assert: (ReflectivityExamples >> #exampleIvarRead) class
		equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleIvarRead equals: 33.
	self assert: tag equals: #ivar