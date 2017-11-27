initialization
link
	^ MetaLink new
		metaObject: self;
		selector: #tagExec:;
		arguments: #(object);
		control: #after