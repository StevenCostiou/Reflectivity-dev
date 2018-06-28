running
run
	| times col |
	times := Dictionary new.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObject ].
	col at: 'Per-object compile at installation time' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectCompileOnExecution ].
	col at: 'Per-object compile at runtime' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectWithCondition ].
	col at: 'Condition compile at installation time' put: col.
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: self runPerObjectWithConditionCompileOnExecution ].
	col at: 'Condition compile at runtime' put: col.
	'/home/steven/rf.txt' asFileReference writeStream
		nextPutAll: (STON toString: times);
		close