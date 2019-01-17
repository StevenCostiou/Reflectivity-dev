tests - level
testRecursionStopper
	"check that we can break a loop"
	| methodNode |
	methodNode := (self class >> #tagExec) ast.
	link := MetaLink new
		metaObject: self;
		selector: #tagExec;
		level: 0.
	methodNode link: link.
	self assert: methodNode hasMetalinkBefore.
	self assert: tag isNil.
	self tagExec.
	self assert: tag equals: #yes.