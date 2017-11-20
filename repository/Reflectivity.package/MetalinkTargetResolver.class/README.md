My job is to resolve targets for metalinks to be put on. I only return the target(s) i resolved for the given parameters, which could be: 
- a collection of ast nodes
- a slot
- a temporary variable 
- a literal variable

Some methods have an option parameter. This is the case for links to be put on slots, temporaries and literal variables.
The option can be one of the following:
#all - will lookup for all access nodes.
#read  - will lookup for read nodes only. 
#write - will lookup for write nodes only (i.e. assignment nodes) .

I do not take care that methods, slots or globals do exist. Users must ensure they provide valid parameters and/or to handle possible errors.

I only have utility methods in class side.