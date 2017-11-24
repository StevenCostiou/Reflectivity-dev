installation
uninstallFromAllAnonymousNodes: aMetaLink
	| objectsForLink |
	(linksRegistry isLinkObjectSpecific: aMetaLink) ifFalse:[^self].
	objectsForLink := linksRegistry objectsForLink: aMetaLink.
	objectsForLink
		do: [ :object | 
			aMetaLink nodes
				do: [ :node | 
					(linkToNodesMapper isNode: node ownedBy: object)
						ifTrue: [ self uninstall: aMetaLink fromNode: node forObject: object ] ] ]