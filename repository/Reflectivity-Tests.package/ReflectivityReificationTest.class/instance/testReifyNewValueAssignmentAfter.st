tests - assignment
testReifyNewValueAssignmentAfter
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleAssignment)
		assignmentNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(newValue).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: tag equals: 3