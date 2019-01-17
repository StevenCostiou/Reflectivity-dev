running
tearDown
	selector ifNotNil: [  
		ReflectivityExamples recompile: selector].
	super tearDown 