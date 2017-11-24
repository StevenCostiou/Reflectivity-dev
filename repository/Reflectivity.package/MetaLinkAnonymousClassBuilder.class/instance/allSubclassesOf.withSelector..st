accessing
allSubclassesOf: class withSelector: selector
	| subclasses |
	subclasses := self anonSubclassesFor: class.
	^subclasses select: [ :c | c selectors includes: selector ]