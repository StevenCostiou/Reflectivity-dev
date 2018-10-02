*Reflectivity
astNodes
	^self owningClass variableNodes select: [ :each | each binding variable == self ]