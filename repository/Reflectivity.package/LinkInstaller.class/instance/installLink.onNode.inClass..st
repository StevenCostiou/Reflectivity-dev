as yet unclassified
installLink: aMetaLink onNode: aNode inClass: anAnonymousClass
	| compiledMethod reflectiveMethod ast |
	compiledMethod := aNode methodNode method.

	"Getting the real ast node on which we will install the metalink.
	If the node does not exists in the anonymous class, we create it
	by copying the original one."
	ast := (anAnonymousClass methodDict
		at: compiledMethod selector
		ifAbsent: [ compiledMethod := compiledMethod copy.
			compiledMethod methodClass: anAnonymousClass.
			reflectiveMethod := ReflectiveMethod on: compiledMethod.
			reflectiveMethod compileAndInstallCompiledMethod.
			reflectiveMethod compiledMethod ]) ast.

	"The ast is linked to the MetaLink (standard API)"
	ast link: aMetaLink