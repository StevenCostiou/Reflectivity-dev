*Reflectivity
assignmentNodes
	^ self astNodes select: [ :ast | ast isWrite  ]