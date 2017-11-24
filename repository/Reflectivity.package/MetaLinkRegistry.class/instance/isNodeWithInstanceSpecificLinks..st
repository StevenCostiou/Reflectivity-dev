registry access
isNodeWithInstanceSpecificLinks: node
	^ (self countObjectSpecificLinksIn: node links) > 0