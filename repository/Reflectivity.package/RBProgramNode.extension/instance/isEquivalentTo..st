*Reflectivity
isEquivalentTo: aNode
	self flag: 'should be tested, does not work on methods after links because of the wrappping now in place'.
	^ aNode methodNode selector = self methodNode selector
		and: [ aNode = self and: [ aNode start = self start and: [ aNode stop = self stop ] ] ]