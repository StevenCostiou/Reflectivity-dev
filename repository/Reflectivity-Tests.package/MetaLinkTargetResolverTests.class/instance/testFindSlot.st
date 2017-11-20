tests
testFindSlot
	| slot |
	slot := ReflectivityExamples slotNamed: 'tag'.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples) == slot.
	self assert: (MetalinkTargetResolver slotNamed: 'tag' for: ReflectivityExamples new) == slot