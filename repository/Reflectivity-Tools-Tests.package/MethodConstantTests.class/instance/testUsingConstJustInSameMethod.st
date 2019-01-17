tests
testUsingConstJustInSameMethod

	| values |
	self skip. "not working for the first call: would need on stack replacement"
	values := OrderedCollection new.
	2 timesRepeat: [ values add: DateAndTime now asMethodConstant ].
	
	self assert: values first == values last