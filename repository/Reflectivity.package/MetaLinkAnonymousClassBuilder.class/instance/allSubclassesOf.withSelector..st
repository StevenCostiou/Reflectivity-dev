accessing
allSubclassesOf: class withSelector: selector
	| subclasses |
	class isAnonymous
		ifTrue: [ ^ OrderedCollection with: class ].
	subclasses := self anonSubclassesFor: class.
	^ (subclasses select: [ :c | c selectors includes: selector ]) asOrderedCollection