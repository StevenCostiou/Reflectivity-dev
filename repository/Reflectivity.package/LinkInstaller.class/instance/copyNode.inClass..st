nodes
copyNode: aNode inClass: anAnonymousClass
	"For now we only copy methods nodes."

	| m anonAst |
	m := anAnonymousClass compile: aNode source.
	anonAst := (anAnonymousClass >> m) ast.
	aNode links ifNotNil: [ :originalLinks | originalLinks do: [ :l | anonAst link: l ] ].
	^ anonAst