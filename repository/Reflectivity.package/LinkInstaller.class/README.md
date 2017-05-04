Object specific MetaLinks: we need to create anon subclasses per object, the subclass is shared between *all* links that are active for this class. We can only remove it when the last link is rem

anonSubclassesRegistry <Dictionary: (Class -> OrderedCollection of: AnonymousClass)>

nodesForObjects

links

Installing

	
If aNode is in the original class of anObject and if there are class scoped links on this node,
	they are installed in the new node of the anonymous subclass. Necessary to preserve the original instrumentation
	of a node which are meant to be applied for all instances of the class.

Uninstalling
We know we can remove a node in an anonymous subclass when there are no more instance specific links on this node. There may be "class scoped" links remaining, but the node can be removed because all these links are present on the superclass node that was copied down in the subclass.

When there are no more nodes specific to a given object, the object is migrated back to its superclass. As there is only one anonymous subclass per object, it is expected that the anonymous subclass is garbaged.

BUG:
- when we add an object specific link to a node that already has links, we copy down the node with all the "class scoped links" in a anonymous subclass and add our object specific link to this node.
- what happens if a new class scoped link is added in the original node ? It should be added to the instance specific node, otherwise behaviors of objects from the original class will be different from those of objects migrated to an anonymous subclass. That should not be.
- same problem about source code changes in the original node.
- solution: listen to source code changes and metalinks operation on ast nodes then propagate them to proper nodes in anonymous subclasses ?
- note: the case is taken care of when removing such node... why not the same when adding ? Tests needed here !


Note: we should replace method operations (copying, removing) by ast manipulation.












