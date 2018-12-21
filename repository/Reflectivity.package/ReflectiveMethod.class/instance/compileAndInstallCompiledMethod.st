evaluation
compileAndInstallCompiledMethod
	self wrapperNeeded ifTrue: [ self generatePrimitiveWrapper ].
	self recompileAST.
	self installCompiledMethod. 