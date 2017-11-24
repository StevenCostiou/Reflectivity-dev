accessing
anonSubclassesFor: aClass
	^ classes at: aClass ifAbsent: [ ^ Array new ]