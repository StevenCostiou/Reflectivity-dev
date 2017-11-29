*Reflectivity
isEquivalentTo: aNode
	^ aNode methodNode selector = self methodNode selector
		and: [ aNode = self
				and: [ aNode start = self start and: [ aNode stop = self stop ] ] ]