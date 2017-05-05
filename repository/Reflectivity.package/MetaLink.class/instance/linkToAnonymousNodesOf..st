installing
linkToAnonymousNodesOf: anAstNode
	"Checks if the class in which anAstNode is installed has any anonymous subclasses where the node has been duplicated and self is installed. If such nodes are found, the link is removed from it."
	self linkInstaller propagateLink: self forNode: anAstNode