tests - sends
testReifyCascadeValue
	| cascadeNode instance |
	cascadeNode := (ReflectivityExamples >> #exampleCascade) ast statements first value.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(value).
	cascadeNode link: link.
	self assert: cascadeNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleCascade) class equals: ReflectiveMethod.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleCascade equals: 1.
	self assert: tag equals: 1