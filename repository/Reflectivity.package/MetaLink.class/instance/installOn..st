installing
installOn: aNode 
	nodes add: aNode.
	self class objectSpecificLinks install: self onNode: aNode. 