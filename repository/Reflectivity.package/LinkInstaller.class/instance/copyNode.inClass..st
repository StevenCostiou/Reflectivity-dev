nodes
copyNode: aNode inClass: anAnonymousClass
	"4 may 2017: only methods nodes are considered."

	| m anonAst |
	m := anAnonymousClass compile: aNode source.
	anonAst := (anAnonymousClass >> m) ast.
	aNode links ifNotNil: [ :originalLinks | originalLinks do: [ :l | anonAst link: l ] ].
	^ anonAst