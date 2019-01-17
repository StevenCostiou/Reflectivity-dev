tests - level
testAfterMethodLevel
	| methodNode |
	"check that level is correct in #after on methodNode"
	methodNode := (ReflectivityExamples >> #exampleMethod) ast.
	link := MetaLink new
		metaObject: self;
		selector: #recordLevel;
		control: #after;
		level: 0.
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	self assert: ReflectivityExamples new exampleMethod equals: 5.
	self assert: tag equals: 1.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: CompiledMethod