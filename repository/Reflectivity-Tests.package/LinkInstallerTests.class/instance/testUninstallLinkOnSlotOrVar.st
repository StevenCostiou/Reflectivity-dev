permalinks
testUninstallLinkOnSlotOrVar
	| link linkRegistry |
	link := MetaLink new.
	linkRegistry := link linkInstaller linksRegistry.
	
	link linkInstaller
		installPermaLinkFor: link
		onSlotNamed: #instVar
		for: ReflectivityExamples2
		option: #all
		instanceSpecific: false.
	link uninstall.
	self assert: link nodes isEmpty.
	self assert: (linkRegistry permaLinksFor:link) isEmpty.
	
	link linkInstaller
		installPermaLinkFor: link
		onClassVarNamed: #classVar
		for: ReflectivityExamples2 new
		option: #all
		instanceSpecific: false.
	link uninstall.
	self assert: link nodes isEmpty.
	self assert: (linkRegistry permaLinksFor:link) isEmpty.