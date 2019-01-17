tests - after - variables
testInsteadClassVariable
	| classVar |
	self skip.
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec;
		control: #instead.
	classVar link: link.
	self assert: classVar hasMetalinkInstead.
	self
		assert:
			(ReflectivityExamples >> #exampleClassVarRead) class
				equals: ReflectiveMethod.
	self assert: tag isNil.
	self
		assert: ReflectivityExamples new exampleClassVarRead equals: #AClassVar.
	self assert: tag equals: 'yes'.
	self
		assert: (ReflectivityExamples >> #exampleClassVarRead) class
		equals: CompiledMethod.
	self deny: (ReflectivityExamples >> #exampleClassVarRead) isQuick