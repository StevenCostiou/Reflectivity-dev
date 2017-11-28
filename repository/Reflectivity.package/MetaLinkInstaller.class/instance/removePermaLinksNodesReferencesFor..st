permalinks
removePermaLinksNodesReferencesFor: aMethodNode
	"Remove all permalink references of permalinks for aMethodNode (if any).
	It includes all permalink installed on any child of aMethodNode or
	any copy of aMethodNode in anonymous classes (including their children)."

	| class anonClasses selector permalinks |
	class := aMethodNode methodClass.
	selector := aMethodNode selector.
	anonClasses := anonSubclassesBuilder allSubclassesOf: class withSelector: selector.
	permalinks := self findPermaLinksForSelector: selector inClass: class.
	permalinks
		do: [ :permalink | 
			| methodNodes |
			methodNodes := IdentitySet with: aMethodNode.
			permalink isInstanceSpecific
				ifTrue: [ methodNodes addAll: (anonClasses collect: [ :anonClass | (anonClass >> selector) ast ]) ].
			methodNodes do: [ :methodNode | self recursiveRemoveMethodNode: methodNode fromPermaLinks: permalink ] ]