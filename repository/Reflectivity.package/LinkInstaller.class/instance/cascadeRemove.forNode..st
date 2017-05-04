links
cascadeRemove: link forNode: aNode
	"WARNING: find a better name for this method and its callers...
	When:
		- a link has been copied down in anonymous subclasses
		- this link has to be removed in the original class
		we must ensure that this link is also removed in anonymous subclasses with the same node"

	| class anonSubClasses |
	class := aNode methodNode methodClass.
	class isAnonymous
		ifTrue: [ ^ self ].
	anonSubClasses := anonSubclassesRegistry at: class ifAbsent: [ ^ self ].
	anonSubClasses
		do: [ :ac | 
			ac
				compiledMethodAt: aNode selector
				ifPresent: [ :compiledMethod | compiledMethod ast removeLink: link ]
				ifAbsent: [  ] ]