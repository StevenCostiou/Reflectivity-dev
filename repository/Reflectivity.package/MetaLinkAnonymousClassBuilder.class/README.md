I build anonymous subclasses for object with instance specific MetaLinks. 

I can compile methods in those subclasses, and provide access to anonymous classes;

I also handle the migration of an object from its original class to an anonymous subclass and vice versa.

I consider that for one anonymous subclass i hold one object reference. I therefore cannot work as is with other clients using anonymous subclasses.