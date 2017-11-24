I register specific kind of links that are instance specific and/or "permanent".

I do not install links, i only know informations necessary to find helpful information for link installation (target instances, link count, nodes...).

### Instance specific links

These links are installed for a given object. 

links <WeakKeyDictionary> I reference target objects (values) for which a link has been installed on (key)

Note that instance specific links can be put on other nodes for other objects and/or classes. An instance specific link can also be a regular link active for all instances of an other classes, or even be put on an other node in the class of the object.

### PermaLinks

These links are installed on slots, temporary variables or class variables. I hold explicit specifications of all the kind of nodes the link should permanently be installed on.

Specifications can be of kind for a given var: 
- #read install on all read nodes of var
- #write install on all assignment nodes of var 
- #all both read and write nodes of var

Usecases:

- A link is put on all reads of slot s of class C. If a new method reading s is added in C, i must hold necessary informations to find the new read nodes of s in the new method. I neither find the nodes nor install links on them myself.

- A link is put on all assignments of slot s of class C. If a method with an assignement of s is modified in C, in must hold necessary informations to check if there is still any assignements nodes of s in this method, and update the link accordingly (i.e. reinstall it on these new nodes if they do exist)

In both these usecases, i provide fast and convenient access to the needed informations.