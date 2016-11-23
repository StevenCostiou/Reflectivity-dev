as yet unclassified
install: aMetaLink onNode: aNode
	| objectsForLink class subclasses immediateSubclass objectsToMigrate |
	objectsForLink := links
		at: aMetaLink
		ifAbsent: [ "If the link is not specific to an object,
			 then we go out. Later when we move all the link
			 installation logic here, the normal installation
			 of the link on a node will happen within this block,
			 before returning" ^ self ].

	"The class we are installing in"
	class := aNode methodNode method methodClass.

	"We need to find every anonymous subclass of class. Assumption is made that these subclasses were 	created by the MetaLink LinkInstaller. "
	subclasses := class allSubclasses select: [ :c | c isAnonymous ].

	"We find the first anonymous subclass of class, which if it does not exist has to be created"
	immediateSubclass := subclasses
		detect: [ :c | c superclass == class ]
		ifNone: [ class newAnonymousSubclass ].

	"Check if the ast node exists in immediateSubclass, else we copy it and we install the link"
	self installLink: aMetaLink  onNode: aNode onClass: immediateSubclass.

	"For each object that is not of class immediateSubclass, we migrate the object"
	objectsToMigrate := objectsForLink
		select:
			[ :object | (object isKindOf: class) and: [ object class isAnonymous not ] ].
	objectsToMigrate
		do: [ :object | 
			(object isKindOf: immediateSubclass)
				ifFalse: [ immediateSubclass adoptInstance: object ] ]