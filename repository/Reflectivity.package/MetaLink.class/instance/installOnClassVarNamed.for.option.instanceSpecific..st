installing - link installer
installOnClassVarNamed: aClassVarName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	self flag: #TooMuchParameters.
	^ self linkInstaller
		installPermaLinkFor: self
		onClassVarNamed: aClassVarName
		for: aClassOrObject
		option: option
		instanceSpecific: instanceSpecific