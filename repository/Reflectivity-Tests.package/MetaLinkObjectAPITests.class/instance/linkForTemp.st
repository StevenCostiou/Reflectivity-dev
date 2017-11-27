initialization
linkForTemp
	^ MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #('ok');
		control: #after