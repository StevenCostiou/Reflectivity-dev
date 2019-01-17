add/remove
install

	link := MetaLink new 
				metaObject: self;
				selector: #increase;
				optionAnnounce: true.
	node link: link.
	self class allCounters at: node put: self.