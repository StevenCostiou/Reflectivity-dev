tests - misc
testDefintionString
	| metaLink |
	metaLink := MetaLink new
		metaObject: nil;
		arguments: #();
		condition: [ true ].
	self assert: (Smalltalk compiler evaluate: metaLink definitionString) definitionString equals: metaLink definitionString