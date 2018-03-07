*Reflectivity
allAfterAreWeak
	self hasMetalink ifFalse: [^false].
	self isMessage ifFalse:  [^false]. "only sends are weak"
	^self afterLinks allSatisfy: [ :link | link hasOption: #optionWeakAfter ].