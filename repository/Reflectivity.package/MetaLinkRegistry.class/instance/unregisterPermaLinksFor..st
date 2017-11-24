permalinks
unregisterPermaLinksFor: aLink
	| permaLinks |
	permaLinks := (self permaLinksFor: aLink) ifEmpty: [ ^ self ].
	permaLinks do: [ :permaLink | (permanentTargets at: permaLink slotOrVariable) remove: permaLink ].
	permalinks removeKey: aLink