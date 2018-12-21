*Reflectivity
readNodes
	^ self astNodes select: [ :ast | ast isRead ]