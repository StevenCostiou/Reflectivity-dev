tests
testFindSlotWithOptions
	| slot readNodes writeNodes |
	slot := ReflectivityExamples slotNamed: 'tag'.
	readNodes := slot readNodes.
	writeNodes := slot assignmentNodes.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #read) = readNodes.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #write) = writeNodes.
	self
		assert:
			(MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples option: #all)
				= (Array with: writeNodes with: readNodes) flattened