ast manipulation
wrapInContext: hook link: aLink
	^RFMessageNode 
		receiver: (RFLiteralVariableNode value: aLink)
		selector: #valueInContext:
		arguments: {self encloseInBlock: hook}
				

	