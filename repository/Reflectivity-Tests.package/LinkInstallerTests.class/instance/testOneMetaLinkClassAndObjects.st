links - installing
testOneMetaLinkClassAndObjects
	"Installs a MetaLink on one class. Installs another MetaLink on one instance of this class.
	- all instances of the class must be affected by the first MetaLink
	- only one specific instance must be affected by the second MetaLink"

	| counter metalink metalink2 |
	self flag: 'Split this test into smaller ones !'.
	counter := 0.

	"First MetaLink affects all objects"
	metalink := MetaLink new.
	metalink selector: #value.
	metalink metaObject: [counter := counter + 1].
	metalink control: #before.
	(ReflectivityExamples >> #exampleMethod) ast link: metalink.	
	
	"The second MetaLink affects only object 3"
	metalink2 := MetaLink new.
	metalink2 selector: #value.
	metalink2 metaObject: [counter := counter + 2].
	metalink2 control: #before.
	(ReflectivityExamples >> #exampleMethod) ast link: metalink2 forObject: obj3.
	
	"Original method must execute as usual"
	self assert: counter equals: 0.
	obj1 exampleMethod.
	self assert: counter equals: 1.
	obj2 exampleMethod.
	self assert: counter equals: 2.
	
	"For object 3, the first MetaLink must be active and increase counter by 1.
	The second MetaLink must affect only this object and increase counter by 2.
	The counter value must be increased by 3."
	obj3 exampleMethod.
	self assert: counter equals: 5.

	"The link is removed from the 3 objects."
	(ReflectivityExamples >> #exampleMethod) ast removeLink: metalink.	

	"Original method must execute as usual"
	obj1 exampleMethod.
	self assert: counter equals: 5.
	obj2 exampleMethod.
	self assert: counter equals: 5.

	"Object 3 still has its instance specific link"
	obj3 exampleMethod.
	self assert: counter equals: 7.