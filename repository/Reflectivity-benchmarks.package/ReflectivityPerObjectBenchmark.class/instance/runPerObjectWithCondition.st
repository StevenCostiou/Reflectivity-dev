running
runPerObjectWithCondition
	|objects object metalink timeToRun|
	objects := OrderedCollection new.
	1000000 timesRepeat: [ objects add: ReflectivityExamples2 new].
	object := objects at: 5000.
	
	metalink := MetaLink new.
	metalink control: #before.
	metalink metaObject: [2 + 3].
	metalink selector: #value.
	metalink condition: [:context| context receiver == object] arguments: #(context).	
	metalink optionCompileOnLinkInstallation: true.
	
	(ReflectivityExamples2 >> #exampleMethod2) ast link: metalink.
	
	timeToRun := [ objects do:[:obj| obj exampleMethod2 ]] timeToRunWithoutGC.
	metalink uninstall.
	^timeToRun
	