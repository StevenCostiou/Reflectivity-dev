links
propagateLinkAddition: link forNode: aNode
	"When:
		- a node has been copied down in anonymous subclasses
		- a link is added to this node in the original class
		> we must ensure that this link is also added in anonymous subclasses with the same node"
	(self collectAnonymousAstsFor: aNode) do: [ :ast | ast link: link ]