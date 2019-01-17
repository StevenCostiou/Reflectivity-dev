tests - method 
testReifyMethodArgsAfter2
	| methodNode |
	methodNode := (ReflectivityExamples >> #exampleMethod) ast.
	link := MetaLink new
		metaObject: [ :aReceiver :aSelector :args :mylink | 
			tag := #yes.
			self assert: aReceiver class equals: ReflectivityExamples.
			self assert: aSelector equals: #exampleMethod.
			self assert: args equals: #().
			self assert: link == link ];
		selector: #value:value:value:value:;
		arguments: #(object selector arguments link);
		control: #after.
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: tag isNil.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: tag equals: #yes.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod