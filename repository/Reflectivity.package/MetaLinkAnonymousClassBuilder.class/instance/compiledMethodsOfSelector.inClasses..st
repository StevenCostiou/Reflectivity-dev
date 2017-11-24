accessing
compiledMethodsOfSelector: selector inClasses: someClasses
	^ (someClasses select: [ :ac | ac selectors includes: selector ])
		collect: [ :ac | ac compiledMethodAt: selector ]