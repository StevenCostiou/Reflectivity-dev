private
genReification: aSymbolOrNode for: aLink
	| plugin | 
	(aSymbolOrNode isKindOf: RBProgramNode) ifTrue: [ ^ aSymbolOrNode].
	plugin := aSymbolOrNode isSymbol 
		ifTrue: [(plugins at: aSymbolOrNode ifAbsent: [self error: 'reification not supported for this entity']) entity: entity link: aLink]
		ifFalse: [ aSymbolOrNode link: aLink; entity: entity. aSymbolOrNode ].
	^plugin perform: self selectorForNode