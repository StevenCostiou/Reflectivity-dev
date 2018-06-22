lookup
removeSuperJumpsFor: methodNode
	| nodesWithLinks |
	nodesWithLinks := methodNode allChildren select: [ :c | c hasLinks ].
	superJumpLinks
		do: [ :link | 
			(nodesWithLinks anySatisfy: [ :node | node links includes: link ])
				ifTrue: [ link uninstall ] ]