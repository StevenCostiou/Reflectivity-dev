permalinks
reinstallPermaLinksForMethod: method
	| permalinks |
	self flag: 'Not up to date, too complicated'.
	permalinks := linksRegistry permaLinksForMethod: method.
	permalinks
		do: [ :pl | 
			| slotOrVar class nodes |
			slotOrVar := pl slotOrVariable.
			class := pl slotOrVarClass.
			nodes := MetalinkTargetResolver slotOrVarNameNodesFor: slotOrVar inMethod: method option: pl persistenceType.
			nodes select:[:node| (node hasLinks or:[(node links includes: pl link)]) not].
			nodes 
				do: [ :node | 
					pl isInstanceSpecific
						ifTrue: [ | instances |
							instances := (linksRegistry objectsForLink: pl link) select: [ :i | i class superclass = class ].
							instances do: [ :instance | node link: pl link forObject: instance ] ]
						ifFalse: [ node link: pl link ] ] ]