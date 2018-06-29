running
run
	| times col |
	times := Dictionary new.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObject ].
	times at: 'Per-object compile at installation time' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectCompileOnExecution ].
	times at: 'Per-object compile at runtime' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectWithCondition ].
	times at: 'Condition compile at installation time' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectWithConditionCompileOnExecution ].
	times at: 'Condition compile at runtime' put: col.
	'/home/steven/rf.txt' asFileReference writeStream
		nextPutAll: (STON toString: times);
		close.
		times inspect