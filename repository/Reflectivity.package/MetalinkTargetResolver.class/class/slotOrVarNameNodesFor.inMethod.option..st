api
slotOrVarNameNodesFor: slotOrVar inMethod: method option: option
	| nodes |
	nodes := method ast allChildren select: [ :node | node name = slotOrVar name ].
	option = #read
		ifTrue: [ ^ nodes select: [ :node | node isRead ] ].
	option = #write
		ifTrue: [ ^ nodes select: [ :node | node isWrite ] ].
	^ nodes