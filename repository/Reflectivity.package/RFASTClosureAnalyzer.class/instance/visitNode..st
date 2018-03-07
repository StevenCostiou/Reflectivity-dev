visiting
visitNode: aNode
	super visitNode: aNode.
	
	aNode hasMetalinkBefore ifTrue: [  
 		aNode beforeHooks do: [:each | super visitNode: each]].
	
	aNode hasMetalinkAfter ifTrue: [  
 		aNode afterHooks do: [:each | super visitNode: each]].