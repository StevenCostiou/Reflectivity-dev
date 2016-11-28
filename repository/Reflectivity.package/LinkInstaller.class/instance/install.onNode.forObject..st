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
	See nodes protocol.
	NOTE: we should also move ''class wide'' metalinks from aNode to the new ast node,
	if there are any. Not to be done however if aNode == ast"
	nodesForObject := nodesForObjects at: anObject ifAbsent: [ nil ].
	ast := (self isNode: aNode specificToObject: anObject)
		ifNil: [ | copyNode |
			copyNode := self copyNode: aNode inClass: anonClass.
			self addNode: copyNode forObject: anObject ].

	"Install the link on the ast node in the anonymous class."
	ast link: aMetaLink.

	"Migrates the object if not already done"
	anObject class == anonClass
		ifFalse: [ anonClass adoptInstance: anObject ]