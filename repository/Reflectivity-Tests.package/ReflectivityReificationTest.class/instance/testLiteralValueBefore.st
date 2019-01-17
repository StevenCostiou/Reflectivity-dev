tests - misc
testLiteralValueBefore
	| literalNode |
	literalNode := (ReflectivityExamples >> #exampleLiteral) ast statements first value.
	self assert: literalNode isLiteralNode.
	link := MetaLink new
		metaObject: [:value | self assert: value equals: 2];
		selector: #value:;
		arguments: #(value);
		control: #before.
	literalNode link: link.
	self assert: literalNode hasMetalinkBefore.
	self assert: ReflectivityExamples new exampleLiteral == 2.	