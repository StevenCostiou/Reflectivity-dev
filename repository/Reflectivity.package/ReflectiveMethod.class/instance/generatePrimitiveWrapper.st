evaluation
generatePrimitiveWrapper
	| wrappedMethod send wrapperMethod assignmentNode |
	OCASTSemanticCleaner clean: ast.
	ast compilationContext 
		semanticAnalyzerClass: RFSemanticAnalyzer;
		astTranslatorClass: RFASTTranslator.
	ast doSemanticAnalysis. "force semantic analysis"
	wrappedMethod := ast generate: compiledMethod trailer.
	
	send := RBMessageNode
		receiver: (RBSelfNode named: #self)
		selector:  #rFwithArgs:executeMethod:
		arguments: {RBArrayNode statements: ast arguments . (RFLiteralVariableNode value: wrappedMethod)}.
	
	assignmentNode := RBAssignmentNode 
		variable: (RBVariableNode named: #RFReifyValueVar)
		value: send.
		
	wrapperMethod := RBMethodNode
		selector: ast selector
		arguments: ast arguments 
		body: assignmentNode asSequenceNode.
		
	wrapperMethod methodClass: ast methodClass.
	wrapperMethod propertyAt: #wrappedPrimitive put: true.
	ast hasMetalink ifTrue: [wrapperMethod propertyAt: #links put: (ast propertyAt: #links)].
	ast := wrapperMethod.