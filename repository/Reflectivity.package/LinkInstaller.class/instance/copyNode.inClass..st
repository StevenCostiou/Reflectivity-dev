nodes
copyNode: aNode inClass: anAnonymousClass
	"4 may 2017: only methods nodes are considered."

	| sourceStream m anonAst |
	sourceStream := WriteStream on: String new.
	sourceStream nextPutAll: aNode selectorAndArgumentNames.
	sourceStream cr.
	sourceStream nextPutAll: '^super '.
	sourceStream nextPutAll: aNode selectorAndArgumentNames.
	m := anAnonymousClass compile: sourceStream contents.
	anonAst := (anAnonymousClass >> m) ast.
	"aNode links ifNotNil: [ :originalLinks | originalLinks do: [ :l | anonAst link: l ] ]."
	^ anonAst