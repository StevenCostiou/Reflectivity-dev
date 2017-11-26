permalinks
removePermaLinksNodesReferencesFor: aMethodNode
	"We have to find all anonymous classes with aMethodNode copy which is going to be removed.
	On all these copies, we have to find all permalinks from which we must remove every node that is
	going to be removed.
	Look for my senders for better understanding."

	| class selector permalinks |
	class := aMethodNode methodClass.
	selector := aMethodNode selector.
	permalinks := linksRegistry
		permaLinksForMethod: aMethodNode compiledMethod
		inClasses:
			((anonSubclassesBuilder allSubclassesOf: class withSelector: selector)
				add: class;
				yourself).
	permalinks
		do: [ :permalink | 
			| methodNodes |
			methodNodes := Array with: aMethodNode.
			permalink isInstanceSpecific
				ifTrue:
					[ methodNodes addAll: (((anonSubclassesBuilder allSubclassesOf: class withSelector: selector) select: [ :c | c selectors includes: selector ]) collect: [ :method | method ast ]) ].
			methodNodes do: [ :methodNode | self recursiveRemoveMethodNode: methodNode fromPermaLinks: permalink ] ]