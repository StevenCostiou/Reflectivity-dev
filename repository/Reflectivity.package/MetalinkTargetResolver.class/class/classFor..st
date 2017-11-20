resolving
classFor: aClassOrObject
	^ aClassOrObject isClass
		ifTrue: [ aClassOrObject ]
		ifFalse: [ aClassOrObject class ]