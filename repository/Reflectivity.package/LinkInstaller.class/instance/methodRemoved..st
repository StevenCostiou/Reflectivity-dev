updating
methodRemoved: aMethodRemoved
	aMethodRemoved methodOrigin isAnonymous
		ifTrue: [ ^ self ].
	self halt