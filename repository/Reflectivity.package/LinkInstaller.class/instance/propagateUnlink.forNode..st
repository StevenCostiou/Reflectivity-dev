links
propagateUnlink: link forNode: aNode
	"When:
		- a link has been copied down in anonymous subclasses
		- this link has to be removed in the original class
		> we must ensure that this link is also removed in anonymous subclasses with the same node"

	(self collectAnonymousAstsFor: aNode) do: [ :ast | ast removeLink: link ]