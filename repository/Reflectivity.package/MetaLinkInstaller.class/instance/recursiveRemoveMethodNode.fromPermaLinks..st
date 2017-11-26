permalinks
recursiveRemoveMethodNode: methodNode fromPermaLinks: permalink
	self flag: 'Fix ifAbsent bloc...'.
	permalink link nodes remove: methodNode ifAbsent: [  ].
	methodNode allChildren do: [ :node | permalink link nodes remove: node ifAbsent: [  ] ]