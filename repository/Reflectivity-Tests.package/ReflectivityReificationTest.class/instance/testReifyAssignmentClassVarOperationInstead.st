tests - operations
testReifyAssignmentClassVarOperationInstead
	| varNode instance reachHere |
	varNode := (ReflectivityExamples >> #exampleAssignmentClassVar) assignmentNodes first.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. operation value];
		selector: #value:;
		control: #instead;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignmentClassVar equals: 3.
	self assert: reachHere.