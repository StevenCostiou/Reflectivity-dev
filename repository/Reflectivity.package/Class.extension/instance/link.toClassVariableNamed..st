*Reflectivity
link: aMetaLink toClassVariableNamed: aClassVariableName
	self
		link: aMetaLink
		toClassVariable: (MetalinkTargetResolver classVariableNamed: aClassVariableName for: self)