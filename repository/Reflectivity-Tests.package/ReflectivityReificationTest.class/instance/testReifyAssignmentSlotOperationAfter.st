tests - operations
testReifyAssignmentSlotOperationAfter
	| varNode instance reachHere |
	varNode := (ReflectivityExamples >> #exampleAssignmentIvar) assignmentNodes first.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. self assert: operation value equals: 3];
		selector: #value:;
		control: #after;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignmentIvar equals: 3.
	self assert: reachHere.