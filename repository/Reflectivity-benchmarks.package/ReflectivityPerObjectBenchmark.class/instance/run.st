running
run
	| objects |
	objects := OrderedCollection new.
	10000000 timesRepeat: [ objects add: ReflectivityExamples2 new ].
	^ [ objects do: [ :obj | obj exampleMethod2 ] ] timeToRunWithoutGC