accessing
compiledMethodsOfSelector: selector inAnonSubClassesOf: class
	| anonSubClasses |
	anonSubClasses := self anonSubclassesFor: class.
	^ self compiledMethodsOfSelector: selector inClasses: anonSubClasses