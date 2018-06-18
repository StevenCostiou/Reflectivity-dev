initialization
linkForTemp
	| okNode |
	okNode := RBLiteralValueNode value: 'ok'.
	^ MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: (Array with: okNode);
		control: #after