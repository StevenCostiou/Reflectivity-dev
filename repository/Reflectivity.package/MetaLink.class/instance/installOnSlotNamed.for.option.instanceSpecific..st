installing - link installer
installOnSlotNamed: aSlotName for: aClassOrObject option: option instanceSpecific: instanceSpecific
	| permalink |
	permalink := self
		permaLinkFor: aClassOrObject
		option: option
		instanceSpecific: instanceSpecific.
	^ self linkInstaller installPermaLink: permalink onSlotNamed: aSlotName