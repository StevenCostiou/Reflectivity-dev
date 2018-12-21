I specify a kind of persistence for links to be put on a slot, a temporary variable or a class variable.  

I can be of kind: 
- #read only read nodes
- #write only assignment nodes 
- #all both

I know the class of the slot/var the link will be put on. I also know my link, although several versions of me can exist for the same link, but with different targets (slots/var).

The isInstanceSpecific inst var seems to be needed to keep track that the metalink is installed on an object, because this information is lost after the link is installed through the API. It could be done better perhaps. 