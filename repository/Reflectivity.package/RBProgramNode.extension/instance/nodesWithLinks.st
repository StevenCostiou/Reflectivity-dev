*Reflectivity
nodesWithLinks
	^ self allChildren select: [ :e | e links isNotEmpty ]