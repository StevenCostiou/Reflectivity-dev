resolving - private
resolvingBlocForOption: option
	option = #write
		ifTrue: [ ^ [ :varOrSlot | varOrSlot assignmentNodes asIdentitySet  ] ].
	option = #read
		ifTrue: [ ^ [ :varOrSlot | varOrSlot readNodes asIdentitySet] ].
	^ [ :varOrSlot | (OrderedCollection with: varOrSlot assignmentNodes with: varOrSlot readNodes) flattened asIdentitySet ]