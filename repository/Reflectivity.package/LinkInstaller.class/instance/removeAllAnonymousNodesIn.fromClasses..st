nodes
removeAllAnonymousNodesIn: methodNode fromClasses: anonClasses
	(anonClasses select: [ :c | (c compiledMethodAt: methodNode selector ifAbsent: [ nil ]) notNil ])
		do: [ :c | 
			| object anonMethodNode anonNodes |
			object := c allInstances first.
			anonMethodNode := (c >> methodNode selector) ast.
			anonNodes := anonMethodNode allChildren select: [ :n | n hasLinks ].
			anonNodes do: [ :node | node links do: [ :link | self uninstall: link fromNode: node forObject: object ] ].
			anonMethodNode hasLinks
				ifTrue: [ anonMethodNode links do: [ :link | self uninstall: link fromNode: anonMethodNode forObject: object ] ] ]