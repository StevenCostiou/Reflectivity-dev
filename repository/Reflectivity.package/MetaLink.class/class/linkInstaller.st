accessing
linkInstaller
	^linkInstaller 
		ifNil: [ linkInstaller := LinkInstaller new ]