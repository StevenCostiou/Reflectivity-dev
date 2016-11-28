nodes
instanceSpecificsLinksCountForNode: aNode
	| nodeLinks |
	nodeLinks := aNode links ifNil: [ ^ 0 ].
	^ (nodeLinks select: [ :link | links keys includes: link ]) size