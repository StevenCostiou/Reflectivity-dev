registry access
countObjectSpecificLinksIn: someLinks
	someLinks ifNil:[^0].
	^ (someLinks select: [ :link | self isLinkObjectSpecific: link ]) size