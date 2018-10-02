installing
announceChange
	self optionAnnounce ifTrue: [SystemAnnouncer uniqueInstance announce: (MetalinkChanged new link: self)]