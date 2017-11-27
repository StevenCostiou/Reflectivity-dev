*Reflectivity
isEquivalentTo: aNode
	^ aNode methodNode name = self methodNode name
		and: [ aNode = self
				and: [ aNode start = self start and: [ aNode stop = self stop ] ] ]