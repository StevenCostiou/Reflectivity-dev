installing
removeNode: aNode
	"Silently remove aNode from the nodes list.
	No effect if aNode was not initially present."
	self hasNodes ifFalse:[^self].
	nodes remove: aNode ifAbsent:[]