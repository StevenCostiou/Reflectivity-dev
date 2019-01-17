tests - instead
testInsteadArray
	| arrayNode |
	arrayNode := (ReflectivityExamples >> #exampleArray) ast statements first value.
	self assert: arrayNode isDynamicArray.
	link := MetaLink new
		metaObject: self;
		control: #instead;
		selector: #return3.
	arrayNode link: link.
	self assert: arrayNode hasMetalinkInstead.
	self assert: (ReflectivityExamples >> #exampleArray) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleArray equals: 3.
	self assert: (ReflectivityExamples >> #exampleArray) class equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleArray) isQuick.