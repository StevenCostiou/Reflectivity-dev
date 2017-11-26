resolving
classFor: aClassOrObject
	| class |
	aClassOrObject isClass
		ifTrue: [ ^ aClassOrObject ].
	class := aClassOrObject class.
	^ class isAnonymous
		ifTrue: [ class superclass ]
		ifFalse: [ class ]