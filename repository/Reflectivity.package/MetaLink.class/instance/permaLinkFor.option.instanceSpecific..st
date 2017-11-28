installing - link installer
permaLinkFor: aClassOrObject option: option instanceSpecific: instanceSpecific
	| permaLink |
	permaLink := PermaLink new.
	permaLink persistenceType: option.
	permaLink isInstanceSpecific: instanceSpecific.
	permaLink slotOrVarClass: aClassOrObject.
	permaLink link: self.
	^ permaLink