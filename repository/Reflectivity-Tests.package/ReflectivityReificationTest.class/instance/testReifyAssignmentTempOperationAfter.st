tests - operations
testReifyAssignmentTempOperationAfter
	| varNode instance reachHere |
	varNode := (ReflectivityExamples >> #exampleAssignment) assignmentNodes first.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. operation value];
		selector: #value:;
		control: #after;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: reachHere.