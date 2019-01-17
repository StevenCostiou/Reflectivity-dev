tests - instead
testInsteadVariableReadTemp
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleAssignment) variableReadNodes first.
	link := MetaLink new
		metaObject: #context;
		selector: #tempNamed:;
		control: #instead;
		arguments: #(#name).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleAssignment) class equals: ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment value equals: 3.