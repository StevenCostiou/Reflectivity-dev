tests
testFindSlotWithOptions
	| slot readNodes writeNodes |
	slot := ReflectivityExamples slotNamed: 'tag'.
	readNodes := slot readNodes asIdentitySet.
	writeNodes := slot assignmentNodes asIdentitySet.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #read) = readNodes.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #write) = writeNodes.
	self
		assert:
			(MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #all)
				= (Array with: writeNodes with: readNodes) flattened asIdentitySet