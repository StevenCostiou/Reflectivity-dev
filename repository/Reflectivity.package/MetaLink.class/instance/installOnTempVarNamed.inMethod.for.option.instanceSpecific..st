installing - link installer
installOnTempVarNamed: aTempName inMethod: aMethodName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| permalink |
	permalink := self permaLinkFor: aClassOrObject option: option instanceSpecific: instanceSpecific.
	^ self linkInstaller installPermaLink: permalink onTempVarNamed: aTempName inMethod: aMethodName