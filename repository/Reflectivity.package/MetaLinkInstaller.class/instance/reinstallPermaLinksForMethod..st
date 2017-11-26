permalinks
reinstallPermaLinksForMethod: method
	| permalinks |
	permalinks := linksRegistry permaLinksForMethod: method.
	permalinks
		do: [ :pl | 
			| slotOrVar class nodes |
			slotOrVar := pl slotOrVariable.
			class := pl slotOrVarClass.
			nodes := MetalinkTargetResolver slotOrVarNodesFor: slotOrVar inMethod: method option: pl persistenceType.
			nodes select: [ :node | node hasLinks not or: [ (node links includes: pl link) not ] ].
			nodes
				do: [ :node | 
					pl isInstanceSpecific
						ifTrue: [ | instances |
							self halt.
							instances := (linksRegistry objectsForLink: pl link) select: [ :i | i class superclass = class ].
							instances do: [ :instance | node link: pl link forObject: instance ] ]
						ifFalse: [ node link: pl link ] ] ]