tests - operations
testReifyTempOperationInstead
	| varNode instance executed |
	varNode := (ReflectivityExamples >> #exampleAssignment) ast body statements last value.
	executed := false.
	link := MetaLink new
		metaObject: [:operation | executed := true. self assert: operation class == RFTempRead. self assert: operation value equals: 3. operation value];
		selector: #value:;
		control: #instead;
		arguments: #(operation).
	varNode link: link.
	self assert: varNode hasMetalink.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: executed.