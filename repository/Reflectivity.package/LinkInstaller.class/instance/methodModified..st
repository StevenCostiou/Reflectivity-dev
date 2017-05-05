announcement handling
methodModified: evt
	| newAst anonAsts |
	newAst := evt method ast.
	anonAsts := self collectAnonymousAstsFor: newAst.
	anonAsts
		do: [ :ast | 
			"Here we have:
				- the ast to be modified
				- the modified ast originating the source code changes"]