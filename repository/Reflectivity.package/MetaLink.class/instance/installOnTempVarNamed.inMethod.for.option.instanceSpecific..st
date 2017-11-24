installing - link installer
installOnTempVarNamed: aTempName inMethod: aMethodName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	self flag: #TooMuchParameters.
	^ self linkInstaller
		installPermaLinkFor: self
		onTempVarNamed: aTempName
		inMethod: aMethodName
		for: aClassOrObject
		option: option
		instanceSpecific: instanceSpecific