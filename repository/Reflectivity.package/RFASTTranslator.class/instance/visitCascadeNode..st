visitor-double dispatching
visitCascadeNode: aCascadeNode 
	valueTranslator visitNode: aCascadeNode receiver.
	
	self emitPreamble: aCascadeNode.
	self emitMetaLinkBefore: aCascadeNode.
	aCascadeNode hasMetalinkInstead
		ifTrue: [ self emitMetaLinkInstead: aCascadeNode ]
		ifFalse: [  
			aCascadeNode messages allButLastDo: [:node |
				methodBuilder pushDup.
				effectTranslator visitNode: node.
			].
				self visitNode: aCascadeNode messages last.].
	self emitMetaLinkAfterNoEnsure: aCascadeNode.