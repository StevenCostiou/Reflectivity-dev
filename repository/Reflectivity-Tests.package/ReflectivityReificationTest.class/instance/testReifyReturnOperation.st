tests - operations
testReifyReturnOperation
	"operation on return makes only sense for #instead (as else the return already was done)"
	"
	| returnNode reachHere instance |
	
	returnNode := (ReflectivityExamples >> #exampleAssignment) ast body statements last.
	reachHere := false.
	link := MetaLink new
		metaObject: [:operation | reachHere := true. operation value];
		selector: #value:;
		control: #instead;
		arguments: #(operation).
	returnNode link: link.
	self assert: returnNode hasMetalink.
	self assert: tag isNil.
	instance := ReflectivityExamples new.
	self assert: instance exampleAssignment equals: 3.
	self assert: reachHere."