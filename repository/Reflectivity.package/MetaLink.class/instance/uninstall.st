installing
uninstall
	self linkInstaller uninstallFromAllAnonymousNodes: self.
	nodes do: [ :node | node removeLink: self ].
	nodes removeAll