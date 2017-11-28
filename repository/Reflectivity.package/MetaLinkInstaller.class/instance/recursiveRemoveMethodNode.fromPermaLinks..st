permalinks
recursiveRemoveMethodNode: methodNode fromPermaLinks: permalink
	"Remove nodes from the link tied to permalink.
	These nodes can be any node in methodNode's children (itself included).
	Doesn't care if the link doesn't know the node, as we have no way of knowing."
	
	permalink link nodes remove: methodNode ifAbsent: [  ].
	methodNode allChildren do: [ :node | permalink link nodes remove: node ifAbsent: [  ] ]