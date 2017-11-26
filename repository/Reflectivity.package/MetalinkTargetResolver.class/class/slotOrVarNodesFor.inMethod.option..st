api
slotOrVarNodesFor: slotOrVar inMethod: method option: option
	| nodes |
	nodes := (self resolvingBlocForOption: option) value: slotOrVar.
	^ nodes select: [ :node | node methodNode method = method ]