as yet unclassified
installLink: aMetaLink onNode: aNode onClass: anAnonymousClass
	| compiledMethod reflectiveMethod ast |
	compiledMethod := aNode methodNode method.
	
	"Getting the real ast node on which we will install the metalink.
	If the node does not exists in the anonymous class, we create it
	by copying the original one."
	ast := (anAnonymousClass methodDict
		at: compiledMethod selector
		ifAbsent: [ compiledMethod := compiledMethod copy.
			compiledMethod class: anAnonymousClass.
			reflectiveMethod := ReflectiveMethod on: compiledMethod.
			CompiledMethod ]) ast.
		
	"If the metalink is already installed on the node, we do nothing.
	Else we install the link."
	"... TODO ..."