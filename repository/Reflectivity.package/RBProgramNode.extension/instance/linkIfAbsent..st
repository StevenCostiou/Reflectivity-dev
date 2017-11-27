*Reflectivity
linkIfAbsent: metalink
	"Per-object check only.
	Links and nodes are stored in IdentitySet so there is already a guarantee that there will be no duplicates. However putting a link already existing for a given node will retrigger method compilation.
	This check is used by MetaLinkInstaller only to avoid multiple and recursive reinstallation of links on nodes." 
	(self hasLinks and: [ self links includes: metalink ])
		ifTrue: [ ^ self ].
	self link: metalink