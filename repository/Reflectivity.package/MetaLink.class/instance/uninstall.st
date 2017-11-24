installing
uninstall
	self linkInstaller uninstallFromAllAnonymousNodes: self.
	self linkInstaller uninstallPermaLinkFor: self.
	nodes do: [ :node | node removeLink: self ].
	nodes removeAll 