permalinks
reinstallPermaLink: permalink onNode: node
	| link instances |
	link := permalink link.
	permalink isInstanceSpecific
		ifFalse: [ node link: link.
			^ self ].
	instances := (linksRegistry objectsForLink: link) select: [ :i | i class superclass = permalink slotOrVarClass ].
	instances do: [ :instance | node link: link forObject: instance ]