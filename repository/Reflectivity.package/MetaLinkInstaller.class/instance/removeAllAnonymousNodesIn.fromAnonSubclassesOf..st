nodes
removeAllAnonymousNodesIn: methodNode fromAnonSubclassesOf: aClass
	"Will check for every ast nodes in methodNode (included) if instance specific links do exist.
	If they exist, they are uninstalled."

	| selector anonClassesWithSelector |
	self flag: 'Code a bit complicated: refactoring ?'.
	selector := methodNode selector.
	anonClassesWithSelector := anonSubclassesBuilder allSubclassesOf: aClass withSelector: selector.
	anonClassesWithSelector
		do: [ :c | 
			| object anonMethodNode anonNodes |
			object := anonSubclassesBuilder soleInstanceOf: c.
			anonMethodNode := (c >> selector) ast.

			"Getting all nodes in the method with links,
			they are instance specific because located 
			in the sole instance of a anonymous class"
			anonNodes := anonMethodNode allChildren select: [ :n | n hasLinks ].

			"We remove the existing links"
			anonNodes do: [ :node | node links do: [ :link | self uninstall: link fromNode: node forObject: object ]].

			"We remove links from the anonymous method node if any"
			anonMethodNode hasLinks
				ifTrue: [ anonMethodNode links do: [ :link | self uninstall: link fromNode: anonMethodNode forObject: object ]. anonMethodNode links removeAll ] ].
	
	"Method nodes are implicetely removed from anonymous subclasses,
	and object are silently moved back to their original class
	if no instance-specific links do exist for them"
	