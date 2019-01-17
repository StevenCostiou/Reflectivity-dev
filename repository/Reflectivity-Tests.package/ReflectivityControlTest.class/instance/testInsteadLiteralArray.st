tests - instead
testInsteadLiteralArray
	| literalArray |
	literalArray := (ReflectivityExamples >> #exampleLiteralArray) ast statements first value.
	self assert: literalArray isLiteralArray.
	link := MetaLink new
		metaObject: self;
		control: #instead;
		selector: #return3.
	literalArray link: link.
	self assert: literalArray hasMetalinkInstead.
	self assert: (ReflectivityExamples >> #exampleLiteralArray) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleLiteralArray equals: 3.
	self assert: (ReflectivityExamples >> #exampleLiteralArray) class equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleLiteralArray) isQuick.