installing - link installer
installOnSlotNamed: aSlotName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	self flag: #TooMuchParameters.
	^ self linkInstaller
		installPermaLinkFor: self
		onSlotNamed: aSlotName
		for: aClassOrObject
		option: option
		instanceSpecific: instanceSpecific