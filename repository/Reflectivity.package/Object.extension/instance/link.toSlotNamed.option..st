*Reflectivity
link: aMetaLink toSlotNamed: aSlotName option: option
	self
		link: aMetaLink
		toNodes:
			(MetalinkTargetResolver
				slotNamed: aSlotName
				for: self
				option: option)