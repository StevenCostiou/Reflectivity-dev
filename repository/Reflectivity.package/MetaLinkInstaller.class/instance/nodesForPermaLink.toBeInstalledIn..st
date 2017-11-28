permalinks
nodesForPermaLink: permalink toBeInstalledIn: method
	"Looking for nodes from method where to install the permalink.
	That means that each of these nodes has no links, 
	or that the link hosted by permalink is not present in their link set."
	| slotOrVar persistenceType nodes |
	slotOrVar := permalink slotOrVariable.
	persistenceType := permalink persistenceType.
	nodes := MetalinkTargetResolver slotOrVarNodesFor: slotOrVar inMethod: method option: persistenceType.
	^ nodes select: [ :node | node hasLinks not or: [ (node links includes: permalink link) not ] ]