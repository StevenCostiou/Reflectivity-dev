visiting
visitNode: aNode
	super visitNode: aNode.
	"if we have any hooks defined --> visit them to do name analysis"
	aNode beforeHooks do: [:each | super visitNode: each].
	aNode insteadHooks do: [:each | super visitNode: each].
	aNode afterHooks do: [:each | super visitNode: each].