resolving - private
resolvingBlocForOption: option
	option = #write
		ifTrue: [ ^ [ :varOrSlot | varOrSlot assignmentNodes ] ].
	option = #read
		ifTrue: [ ^ [ :varOrSlot | varOrSlot readNodes ] ].
	^ [ :varOrSlot | (OrderedCollection with: varOrSlot assignmentNodes with: varOrSlot readNodes) flattened ]