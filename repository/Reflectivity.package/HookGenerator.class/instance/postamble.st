results
postamble
	| postamble |
	"This is code executed just before the #after link"
	
	postamble := OrderedCollection new.
	links do: [:link |  
		plugins do: [ :plugin | (link allReifications includes: plugin key) ifTrue: [postamble addAll: ((plugin entity: entity link: link) postamble: entity)]]].
		
	^postamble