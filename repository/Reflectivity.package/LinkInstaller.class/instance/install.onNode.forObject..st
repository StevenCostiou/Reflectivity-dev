installation
install: aMetaLink onNode: aNode forObject: anObject
	| class anonClass nodesForObject ast |
	"Building the anonymous subclass if necessary.
	Assumption is made that there is a single anonymous class for a given object."
	class := anObject class.
	anonClass := class isAnonymous
		ifTrue: [ class ]
		ifFalse: [ class newAnonymousSubclass ].

	"Recovering the ast node in the anonymous class.
	If it does not exists, it is copied from the original node in the anon class.
	28 Nov 16: we only take into account method nodes in the copyNode:inClass: method.
	See nodes protocol."
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ nil ].
	ast := (self findNode: aNode forObject: anObject)
		ifNil: [ | copyNode |
			copyNode := self copyNode: aNode inClass: anonClass.
			self addNode: copyNode forObject: anObject ].

	"Install the link on the ast node in the anonymous class."
	ast link: aMetaLink.

	"If aNode is in the original class of anObject and if there are ''class scoped'' links on this node,
	they are installed in the new node of the anonymous subclass. Necessary to preserve the original instrumentation
	of a node which are meant to be applied for all instances of the class."
	ast == aNode
		ifFalse: [ aNode links ifNotNil: [ :otherLinks | otherLinks do: [ :link | ast link: link ] ] ].

	"Migrates the object if not already done"
	anObject class == anonClass
		ifFalse: [ anonClass adoptInstance: anObject ]