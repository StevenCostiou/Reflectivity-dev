tests - assignment
testReifyValueAssignmentAfter
	"#value for Assignemnt is the new value when #after"
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleAssignment)assignmentNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		control: #after;
		arguments: #(value).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: tag equals: 3