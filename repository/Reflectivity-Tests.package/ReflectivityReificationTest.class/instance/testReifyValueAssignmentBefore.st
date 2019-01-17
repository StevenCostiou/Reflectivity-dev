tests - assignment
testReifyValueAssignmentBefore
	"#value for Assignemnt is the old value, is that what we want?"
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleAssignment) assignmentNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(value).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: tag equals: nil