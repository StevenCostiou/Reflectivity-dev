permalinks
testUninstallLinkOnSlotOrVar
	| link linkRegistry |
	link := MetaLink new.
	linkRegistry := link linkInstaller linksRegistry.
	
	link installOnSlotNamed: #instVar
		for: ReflectivityExamples2
		option: #all
		instanceSpecific: false.
	link uninstall.
	self assert: link nodes isEmpty.
	self assert: (linkRegistry permaLinksFor:link) isEmpty.
	
	link installOnClassVarNamed: #classVar
		for: ReflectivityExamples2 new
		option: #all
		instanceSpecific: false.
	link uninstall.
	self assert: link nodes isEmpty.
	self assert: (linkRegistry permaLinksFor:link) isEmpty.