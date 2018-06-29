creation
removeMethodNode: aNode fromObject: anObject
	anObject class isAnonymous ifFalse:[^self].
	anObject class removeSelector: aNode methodNode selector.
