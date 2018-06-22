lookup
installSuperJumpLinksInMethodNode: node
	"Installs a metalink wich provokes a super jump: 
	when sending a message to super in an anonymous class, 
	instead of starting the lookup in the super class (wich is the original class of the object),
	the lookup is started in the super super class (which is the intented superclass)."

	(node allChildren select: [ :n | n isSuper ])
		do: [ :superNode | 
			| messageSendNode superSuperClass link |
			messageSendNode := superNode parent.
			superSuperClass := node methodClass superclass superclass.
			link := MetaLink new.
			link control: #instead.
			link arguments: #(arguments receiver).
			link selector: #value:value:.
			link metaObject: [ :args :receiver | receiver perform: messageSendNode selector withArguments: args inSuperclass: superSuperClass ].
			superJumpLinks add: link.
			messageSendNode link: link ]