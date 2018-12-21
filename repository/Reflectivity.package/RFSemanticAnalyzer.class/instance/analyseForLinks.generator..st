visiting
analyseForLinks: aNode generator: aGenerator

	aNode propertyAt: #preambles put: aGenerator preamble.
	aNode preambles do: [:each | self visitNode: each].
	
	aNode hasMetalinkBefore ifTrue: [  
		aNode propertyAt: #beforeHooks put: aGenerator beforeHooks.
 		aNode beforeHooks do: [:each | self visitNode: each]].
	
	aNode hasMetalinkAfter ifTrue: [    
		aNode propertyAt: #postambles put: aGenerator postamble.
		aNode postambles do: [:each | self visitNode: each].
		aNode propertyAt: #afterHooks put: aGenerator afterHooks.
		aNode afterHooks do: [:each | self visitNode: each]].
	
	aNode hasMetalinkInstead ifTrue: [  
		aNode propertyAt: #insteadHooks put: aGenerator insteadHooks.
 		aNode insteadHooks do: [:each | self visitNode: each]].	
