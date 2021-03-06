tests
testFindClassVariableWithOptions
	| classVar readNodes writeNodes |
	classVar := ReflectivityExamples classVariableNamed: 'singleton'.
	readNodes := classVar readNodes asIdentitySet.
	writeNodes := classVar assignmentNodes asIdentitySet.
	self assert: (MetalinkTargetResolver classVariableNamed: 'singleton' for: ReflectivityExamples option: #read) = readNodes.
	self assert: (MetalinkTargetResolver classVariableNamed: 'singleton' for: ReflectivityExamples option: #write) = writeNodes.
	self
		assert:
			(MetalinkTargetResolver classVariableNamed: 'singleton' for: ReflectivityExamples option: #all)
				= (Array with: writeNodes with: readNodes) flattened asIdentitySet