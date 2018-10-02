options
optionAnnounce: aBoolean
	aBoolean
		ifTrue: [ options add: #optionAnnounce ] 
		ifFalse: [ options remove: #optionAnnounce ifAbsent:[] ]