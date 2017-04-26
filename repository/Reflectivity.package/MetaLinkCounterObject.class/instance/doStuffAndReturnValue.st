evaluating
doStuffAndReturnValue

	|a b|
	a:= Random new next.
	b := OrderedCollection new.
	b add: a.
	^b