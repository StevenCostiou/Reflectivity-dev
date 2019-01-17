tests - misc
testLiteralOperationAfter
	| literalNode |
	literalNode := (ReflectivityExamples >> #exampleLiteral) ast statements first value.
	self assert: literalNode isLiteralNode.
	link := MetaLink new
		metaObject: [:value | self assert: value value equals: 2];
		selector: #value:;
		arguments: #(operation);
		control: #after.
	literalNode link: link.
	self assert: literalNode hasMetalinkAfter.
	self assert: ReflectivityExamples new exampleLiteral == 2.