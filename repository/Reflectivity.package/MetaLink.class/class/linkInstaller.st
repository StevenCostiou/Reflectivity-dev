accessing
linkInstaller
	^linkInstaller 
		ifNil: [ linkInstaller := MetaLinkInstaller new ]