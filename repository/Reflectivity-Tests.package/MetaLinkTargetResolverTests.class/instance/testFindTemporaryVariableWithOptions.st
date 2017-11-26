tests
testFindTemporaryVariableWithOptions
	| temp readNodes writeNodes |
	temp := ReflectivityExamples >> #exampleIfTrueIfFalse temporaryVariableNamed: #t.
	readNodes := temp readNodes asIdentitySet.
	writeNodes := temp assignmentNodes asIdentitySet.
	self
		assert:
			(MetalinkTargetResolver
				temporaryNamed: #t
				inMethod: #exampleIfTrueIfFalse
				for: ReflectivityExamples
				option: #read) = readNodes.
	self
		assert:
			(MetalinkTargetResolver
				temporaryNamed: #t
				inMethod: #exampleIfTrueIfFalse
				for: ReflectivityExamples
				option: #write) = writeNodes.
	self
		assert:
			(MetalinkTargetResolver
				temporaryNamed: #t
				inMethod: #exampleIfTrueIfFalse
				for: ReflectivityExamples
				option: #all) = (Array with: writeNodes with: readNodes) flattened asIdentitySet