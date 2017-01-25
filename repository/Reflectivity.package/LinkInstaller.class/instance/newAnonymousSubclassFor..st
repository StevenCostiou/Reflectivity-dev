private
newAnonymousSubclassFor: aClass
	| anonSubclass |
	anonSubclass := aClass newAnonymousSubclass.
	(anonSubclassesRegistry at: aClass ifAbsentPut: WeakSet new)
		add: anonSubclass.
	^ anonSubclass