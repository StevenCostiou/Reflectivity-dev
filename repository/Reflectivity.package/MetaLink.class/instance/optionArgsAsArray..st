options
optionArgsAsArray: aBoolean
	"If this option is set to true, this metalink will send the required reified elements to its metaobject as one single array instead of as multiple arguments"
	aBoolean
		ifTrue: [ options add: #argsAsArray ] 
		ifFalse: [ options remove: #argsAsArray ifAbsent:[] ]