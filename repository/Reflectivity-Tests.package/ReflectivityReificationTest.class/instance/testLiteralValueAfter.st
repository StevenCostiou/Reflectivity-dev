tests - misc
testLiteralValueAfter
	| literalNode |
	literalNode := (ReflectivityExamples >> #exampleLiteral) ast statements first value.
	self assert: literalNode isLiteralNode.
	link := MetaLink new
		metaObject: [:value | self assert: value equals: 2];
		selector: #value:;
		arguments: #(value);
		control: #after.
	literalNode link: link.
	self assert: literalNode hasMetalinkAfter.
	self assert: ReflectivityExamples new exampleLiteral == 2.