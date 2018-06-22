running
runPerObjectWithCondition
	|objects object metalink timeToRun|
	objects := OrderedCollection new.
	10000000 timesRepeat: [ objects add: ReflectivityExamples2 new].
	object := objects first.
	
	metalink := MetaLink new.
	metalink control: #instead.
	metalink metaObject: [2 + 3].
	metalink selector: #value.
	metalink condition: [:context| context receiver == object] arguments: #(context).
	
	(ReflectivityExamples2 >> #exampleMethod2) ast link: metalink.
	
	timeToRun := [ objects do:[:obj| obj exampleMethod2 ]] timeToRunWithoutGC.
	metalink uninstall.
	^timeToRun
	