#TODO and notes
- Should we replace method operations (copying, removing) by ast manipulation ?
- Peer reviews... ?
- For now, only method nodes can be affected by object specific links.

#document inst vars and their usage
anonSubclassesRegistry <Dictionary: (Class -> WeakSet of: AnonymousClass)> This table contains for a given class all its anonymous subclasses for which there are instance specific links. Each anonymous class has exactly one instance.

nodesForObjects <WeakKeyDictionary (Object -> WeakSet of: RBMethodNode)>

links <WeakKeyDictionary (MetaLink -> WeakSet of: Object)> For each instance specific link, stores all objects it does affect. Used only for counting the number of objects affected by a given link. Maybe could be removed and replaced by a computation.

#document basic usage of the link installer

#Installing
When a link is put on a specific object, an anonymous subclass of the object's class is generated and the object is migrated to this subclass. There is a 1-1 mapping between objects an their anonymous class. That means that if we put two instance specific links on two objects of class A, these objects will migrate to two different anonymous subclasses of A. However, putting a new instance specific link to one of these objects will preserve its anonymous class and will not migrate the object to another subclass.
	
If aNode is in the original class of anObject and if there are class scoped links on this node,  they are installed in the new node of the anonymous subclass. It is necessary to preserve the original instrumentation of a node which are meant to be applied for all instances of the class.

#Uninstalling
We know we can remove a node in an anonymous subclass when there are no more instance specific links on this node. There may be "class scoped" links remaining, but the node can be removed because all these links are present on the superclass node that was copied down in the subclass.

When there are no more nodes specific to a given object, the object is migrated back to its superclass. As there is only one anonymous subclass per object, it is expected that the anonymous subclass is garbaged and the object is now an instance of its original class.

#Linking and unlinking subtleties
As already said, when putting a link on a node for a specific object an anonymous subclass is generated  and the node is copied down from the origin class to its anonymous subclass. When adding or removing a new link to the node in the original class, we ensure that this link is also added/removed from all nodes copies in the corresponding anonymous subclasses.

#Listening for code changes
The link installer listens for method source code changes and  must update its anonymous classes nodes with those changes. Not done yet. See LinkInstaller >> #methodChanged:

Also there is the problem of renaming a method in a class for which an anonymous subclass with a copy of this method has been made.














