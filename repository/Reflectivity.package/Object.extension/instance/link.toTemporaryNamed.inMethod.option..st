*Reflectivity
link: aMetaLink toTemporaryNamed: aTempVarName inMethod: aMethodName option: option
	self
		link: aMetaLink
		toNodes:
			(MetalinkTargetResolver
				temporaryNamed: aTempVarName
				inMethod: aMethodName
				for: self
				option: option)