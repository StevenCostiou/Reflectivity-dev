permalinks
reinstallPermaLinksForMethod: method
	| permalinks |
	permalinks := linksRegistry permaLinksForMethod: method.
	permalinks
		do: [ :permalink | 
			| nodes |
			nodes := self nodesForPermaLink: permalink toBeInstalledIn: method.
			nodes do: [ :node | self reinstallPermaLink: permalink onNode: node ] ]