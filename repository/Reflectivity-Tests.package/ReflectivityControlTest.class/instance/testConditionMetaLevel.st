tests - level
testConditionMetaLevel
	"check that the condition is evaluated on the same meta level as the link"
	| sendNode |
	sendNode := (ReflectivityExamples >> #exampleMethod) sendNodes first.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec:;
		condition: [ self assert: Processor activeProcess level == 1. true ];
		level: 0;
		arguments: #(#node).
	sendNode link: link.
	self assert: sendNode hasMetalinkBefore.
	self assert: tag isNil.
	ReflectivityExamples new exampleMethod.
	self assert: tag class equals: RBMessageNode.