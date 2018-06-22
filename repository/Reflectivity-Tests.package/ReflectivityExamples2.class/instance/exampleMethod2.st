example
exampleMethod2
	^ (WriteStream on: String new)
		nextPutAll: 'hello world';
		contents