tests - operations
testReifyAssignmentTempOperationBefore
	| varNode instance reachHere |
	varNode := (ReflectivityExamples >> #exampleAssignment) assignmentNodes first.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. self assert: operation value equals: 3];
		selector: #value:;
		control: #before;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: reachHere.
