*Reflectivity
assignmentNodes
	^ (self astNodes select: [ :ast | ast isWrite ])
		collect: [ :node | node parent ]