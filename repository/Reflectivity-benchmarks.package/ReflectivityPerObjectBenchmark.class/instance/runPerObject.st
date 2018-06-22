running
runPerObject
	|objects object metalink timeToRun|
	objects := OrderedCollection new.
	10000000 timesRepeat: [ objects add: ReflectivityExamples2 new].
	object := objects first.
	
	metalink := MetaLink new.
	metalink control: #instead.
	metalink metaObject: [2 + 3].
	
	(ReflectivityExamples2 >> #exampleMethod2) ast link: metalink forObject: object.
	
	timeToRun := [objects do:[:obj| obj exampleMethod2 ]] timeToRunWithoutGC.
	metalink uninstall.
	^timeToRun
	