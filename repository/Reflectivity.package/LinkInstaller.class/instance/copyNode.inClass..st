nodes
copyNode: aNode inClass: anAnonymousClass
	"For now we only copy methods nodes."

	| ast compiledMethod reflectiveMethod |
	true
		ifTrue: [ | m anonAst |
			m := anAnonymousClass compile: aNode source.
			anonAst := (anAnonymousClass >> m) ast.
			aNode links
				ifNotNil: [ :originalLinks | originalLinks do: [ :l | anonAst link: l ] ].
			^ anonAst ].
	ast := aNode copy.
	ast methodClass: anAnonymousClass.
	compiledMethod := ast methodNode generate.
	reflectiveMethod := ReflectiveMethod on: compiledMethod.

	"If we do not recompile the method now, the RBProgramNode>>#link: method will try to access the method which is not compiled and the link installation will fail."
	reflectiveMethod compileAndInstallCompiledMethod.
	^ reflectiveMethod ast