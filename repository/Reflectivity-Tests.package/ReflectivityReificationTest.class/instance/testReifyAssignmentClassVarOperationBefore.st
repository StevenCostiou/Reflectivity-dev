tests - operations
testReifyAssignmentClassVarOperationBefore
	| varNode instance reachHere |
	varNode := (ReflectivityExamples >> #exampleAssignmentClassVar) assignmentNodes first.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. self assert: operation value equals: 3];
		selector: #value:;
		control: #before;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignmentClassVar equals: 3.
	self assert: reachHere.