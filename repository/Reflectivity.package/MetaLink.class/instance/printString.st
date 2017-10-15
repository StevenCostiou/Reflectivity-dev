link api
printString
	|ws|
	ws := WriteStream on: String new.
	ws nextPutAll: (self control ifNil:['']).
	ws space.
	ws nextPutAll: metaObject printString.
	ws space.
	ws nextPutAll: selector asString.
	^ws contents