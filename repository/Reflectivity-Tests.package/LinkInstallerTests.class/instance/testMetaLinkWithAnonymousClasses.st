links - installing
testMetaLinkWithAnonymousClasses
	| metalink |

	"We just need to link a MetaLink to an object"
	metalink := MetaLink new.
	(obj1 class >> #exampleMethod) ast link: metalink forObject: obj1.

	"One of the 2 objects must have migrated to another class"
	self assert: obj1 class ~= obj2 class.
	self assert: obj1 class superclass == ReflectivityExamples.
	self assert: obj2 class == ReflectivityExamples.

	"After removing the link, the object is back to its original class"
	(obj1 class >> #exampleMethod) ast removeLink: metalink forObject: obj1.
	self assert: obj1 class == ReflectivityExamples.
	self assert: obj2 class == ReflectivityExamples