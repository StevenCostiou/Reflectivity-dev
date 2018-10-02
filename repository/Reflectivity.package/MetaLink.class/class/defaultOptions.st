options
defaultOptions
	^ #(
	+ optionInlineMetaObject            "meta object is inlined by default."
	+ optionInlineCondition              "condition is inlined by default."
	- optionCompileOnLinkInstallation   "generate compiledMethod on link installation"
	- optionOneShot                     "remove link after first activation"
	- optionMetalevel                   "force level: 0 for the link"
	- optionDisabledLink                "links are active by default"
	+ optionWeakAfter 						  "do not use #ensure: for #after "
	- optionAnnounce                    "do we announce adding / removing links? Slow"
	- argsAsArray                       "pass all arguments in one array. By default off as it adds an array creation"
	)