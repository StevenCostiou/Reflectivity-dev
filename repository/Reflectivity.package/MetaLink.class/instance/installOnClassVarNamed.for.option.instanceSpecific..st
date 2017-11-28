installing - link installer
installOnClassVarNamed: aClassVarName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| permalink |
	permalink := self permaLinkFor: aClassOrObject option: option instanceSpecific: instanceSpecific.
	^ self linkInstaller installPermaLink: permalink onClassVarNamed: aClassVarName