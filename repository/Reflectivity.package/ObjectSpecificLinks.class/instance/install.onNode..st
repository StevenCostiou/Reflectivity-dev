as yet unclassified
install: aMetaLink onNode: aNode
	| class |
	"are we installing a objectSpecific link?"
	(objects values flattened includes: aMetaLink) ifFalse: [ ^self ].
	class := aNode methodNode method methodClass. "the class we are installing in"
	
	"is the link specific for this object?"
	objects keys anySatisfy: [ :each | each class inheritsFrom: class ].

	"Here we need to generate Anon Class if not already done and if we install an object speficic link for this class.
	
	Here we need to copy down the method (AST with links) if we are an object specific link for thos class *and* the method is not yet copied down.
	
	All this should be done by the ObjectSpecificLinks class"