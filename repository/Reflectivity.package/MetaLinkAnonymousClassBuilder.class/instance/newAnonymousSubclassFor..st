creation
newAnonymousSubclassFor: aClass
	| anonSubclass |
	anonSubclass := aClass newAnonymousSubclass.
	(classes at: aClass ifAbsentPut: WeakSet new)
		add: anonSubclass.
	^ anonSubclass