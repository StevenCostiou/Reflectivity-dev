creation
anonymousClassForObject: anObject
	"Building the anonymous subclass for an object.
	If the object already is instance of an anonymous class, its class is returned as is.
	Otherwise an anonymous class is derived from its class.
	There is a single anonymous class by adapted object (1-1 relationship)."

	| class |
	class := anObject class.
	^ class isAnonymous
		ifTrue: [ class ]
		ifFalse: [ self newAnonymousSubclassFor: class ]