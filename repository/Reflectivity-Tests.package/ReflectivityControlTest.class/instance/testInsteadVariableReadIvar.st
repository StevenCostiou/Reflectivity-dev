tests - instead
testInsteadVariableReadIvar
	| varNode instance |
	varNode := (ReflectivityExamples >> #exampleIvarRead) variableReadNodes first.
	link := MetaLink new
		metaObject: #object;
		selector: #instVarNamed:;
		control: #instead;
		arguments: #(#name).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class equals: ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: instance exampleIvarRead value equals: 33.
	self deny: (ReflectivityExamples >> #exampleIvarRead) isQuick.	"yes, we changed the method"