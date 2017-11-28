permalinks
registerAndInstallPermaLink: aPermaLink forTarget: aSlotOrVar
	| nodes |
	(linksRegistry canReinstallPermaLink: aPermaLink)
		ifFalse: [ ^ self ].
		
	linksRegistry registerPermaLink: aPermaLink.
	
	nodes := MetalinkTargetResolver resolveASTLookupFor: aSlotOrVar option: aPermaLink persistenceType.
	aPermaLink targetObjectOrClass link: aPermaLink link toNodes: nodes