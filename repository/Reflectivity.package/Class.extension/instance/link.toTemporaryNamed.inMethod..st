*Reflectivity
link: aMetaLink toTemporaryNamed: aTempVarName inMethod: aMethodName
	self
		link: aMetaLink
		toTemporary: (MetalinkTargetResolver temporaryNamed: aTempVarName inMethod: aMethodName for: self)